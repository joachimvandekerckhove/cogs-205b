classdef WienerNode < Node
    % WIENERNODE  A class for the Wiener distribution node in a graph
    
    % The main property is now the data, but Data is defined in the parent
    properties
    end
    
    % The main properties are the mean and standard deviation
    properties (SetAccess = private)
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = 1;
        Name = 'Wiener';
    end
    
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new WienerNode
        function obj = WienerNode(Data)
            obj.Data = Data;
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf('  %s distribution node\n', obj.Name);
        end
        
        
        % Print the distribution to screen
        function str = print(obj)
            str = sprintf('  %s distribution node\n', obj.Name);
        end
        
        % Computation functions
        
        % Cumulative distribution function
        function yax = cdf(obj, parameters)
            error('Not yet implemented')
        end
        
        % Probability density function
        function yax = pdf(obj, parameters)
            yax = obj.ScalingConstant * pdfKernel(obj, parameters);
        end
        
        % Log Probability density function
        function yax = logPdf(obj, parameters)
            yax = log(obj.ScalingConstant) + obj.logPdfKernel(parameters);
        end
        
        % Probability density kernel
        function knl = pdfKernel(obj, parameters)
            y = obj.Data ./ (parameters(1,2).^2);
            transformation = fy(y , parameters(1,4));
            knl = 1 ./ (parameters(1,2).^2) .* exp(-parameters(1,1) .* parameters(1,2) .* parameters(1,4) - ((parameters(1).^2) .* obj.Data .* 0.5))...
                 .* transformation
        end

        function dy = fy(point, beta)
        %myFun - Description
            evaluation = []
            stepn = 0;
            while bandera == 0;
                stepn = stepn+1;
                evaluation(stepn,1) = pi .* sk(point,stepn,beta);
                if stepn > 1;
                    if (evaluation(stepn-1,1)-evaluation(stepn,1)) <= 0.00001;
                        dy = pi .* sum(evaluation);
                        bandera = 1;
                    else
                        bandera = 0;
                    end
                else 
                    bandera = 0;
                end
            end
        end

        function pointk = sk(xv,k,w)
        %myFun - Description
            pointk = k .* exp(- (k).^2 .* (pi).^2 .* 0.5 .* xv) .* sin(k .* pi .* w)
        end
        
        % Probability density log kernel
        function knl = logPdfKernel(obj, parameters)
            knl = log(pdfKernel(obj, parameters));
        end
        
        % Random number generator
        function x = rnd(obj, dims)
            error('Not yet implemented')
        end
        
    end
    
    
    % Static methods don't need the object as input
    methods (Static)
        
        testSuite()
        
    end
    
end
