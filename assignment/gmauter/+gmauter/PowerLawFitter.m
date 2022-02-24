classdef PowerLawFitter < handle
    
    properties
        ObservedRT (1, :) % row vector of observed mean reaction times over N trials
    end
    
    properties (Dependent)
        Count % a scalar giving the number of trials in MeanRT
    end
    
    properties (SetAccess = private)
        EstimatedAsymptote 
        EstimatedRange 
        EstimatedExposure 
        EstimatedRate 
    end
    
    methods
        
        % constructor function
        function obj = PowerLawFitter(RTData)
            if nargin > 0
                obj.ObservedRT = RTData;
            else
                obj.ObservedRT = [313 306 300 293 287 288 285 281 279 275 274 273 ...
                    271 272 275 268 269 265 269 264 266 264 265 264 263];
            end
        end
        
        
        % get # trials in RTData
        function count = get.Count(obj)
            count = length(obj.ObservedRT);
        end
        
        % set 
        function obj = set.ObservedRT(obj, value)
            % Set the value
            obj.ObservedRT = value;
   
        end
        
        
        function ERT = Expectation(obj)
            % output is ERT, a vector of expected reaction times over N
            % trials where N is count
           
            % initialize for 'speed'
            ERT = zeros(1:obj.Count);
            
            % compute ERT for each index
            for t = 1:obj.Count
                ERT(t) = obj.EstimatedAsymptote + obj.EstimatedRange * (t + obj.EstimatedExposure)^(-obj.EstimatedRate);
            end
             
        end
        
        function SSE = SumOfSquaredError(obj)
            % output is SSE, a scalar that is the squared difference
            % between ERT and ObservedRT, summed
            ERT = Expectation(obj);
            SSE = sum((ERT - obj.ObservedRT).^2); % shoutout Jeff Rouder
        end
        
        function Fit(obj)
            % after running fit, the private access properties should be
            % set to be the estimated parameters of the power law to these
            % data
            
            %set arbitrary values
            t = 1:obj.Count;
            SSEFunction = @(p) sum(p(1)+p(2).*(t+p(3).^(-p(4))-obj.ObservedRT).^2);
           
            range = max(obj.ObservedRT) - min(obj.ObservedRT); % get range of RTData
            options = optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
            initVals = fminsearch(SSEFunction, [mean(obj.ObservedRT), range , 1, 1], options);
   
                       
            % check if parameter estimates are set
            if obj.EstimatedAsymptote == initVals(1) && obj.EstimatedRange == initVals(2) ...
                    && obj.EstimatedExposure == initVals(3) && obj.EstimatedRate == initVals(4)
                sprintf('Parameter estimates set - will not recompute unless data is changed')
            else % set parameter estimates
                obj.EstimatedAsymptote = initVals(1);
                obj.EstimatedRange = initVals(2);
                obj.EstimatedExposure = initVals(3);
                obj.EstimatedRate = initVals(4);
            end
            
        end
        
        function disp(obj)
           % prints to the screen information about the current data, such
           % as the number of trials and also parameter estimates if they
           % are available.
           fprintf('- Power Law Fitter Info -\n');
           fprintf('~ # trials: %d\n', obj.Count);
           fprintf('~ Estimated Asymptote (A): %d\n', obj.EstimatedAsymptote);
           fprintf('~ Estimated Range (B): %d\n', obj.EstimatedRange);
           fprintf('~ Estimated Exposure (E): %d\n', obj.EstimatedExposure);
           fprintf('~ Estimated Rate (beta): %d\n', obj.EstimatedRate);
           
        end
        
        
        
        % Tests
        
        function TestObservedRT(testCase) % test is bad data set is positive
            
            badData = [-313, -306, -300, -293, -287, -288, -285, -281, -279, -275, -274, ...
                -273, -271, -272, -275, -268, -269, -265, -269, -264, -266, -264, -265, -264, -263];
            
            badCall = @() PowerLawFitter(badData);
           
            verifyGreaterThan(testCase, badCall, 0)
        end
        
        function TestCount(testCase) % test if given data is same length as our data
            
            badLength = length([1, 2, 3, 4, 5]);
            goodLength = PowerLawFitter().Count;
            verifyEqual(testCase, badLength, goodLength) 
            
        end
        
        
        function TestEstimate(testCase) % test is given data set is correct length
            
            RTdata = [313, 306, 300, 293, 287, 288, 285, 281, 279, 275, 274, ...
                273, 271, 272, 275, 268, 269, 265, 269, 264, 266, 264, 265, 264, 263];
            
            expectedLength = 25;
            actualLength = PowerLawFitter(RTdata).Count;
            
            verifyEqual(testCase, expectedLength, actualLength)
            
        end
        
        function TestSSE(testCase) % test if SSE scalar is positive
            
            testData = [300, 320, 320, 310, 300, 290, 280, 290, 300]
            scalar = @() PowerLawFitter().SumOfSquaredError
            verifyGreaterThan(testCase,scalar, 0)
            
        end
        
        function TestFit(testCase) % test is Fit throws warning
            
            testFit = @() PowerLawFitter()
            verifyWarningFree(testCase, testFit)
            
        end
        
        function TestDisp(testCase) % test if disp throws warning
            
            testDisp = @() PowerLawFitter()
            verifyWarningFree(testCase, testDisp)
            
        end
        

    end
end

