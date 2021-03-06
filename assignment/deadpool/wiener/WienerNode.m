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
            transformation = fy( parameters(1,2), parameters(1,4));
            knl(i) = 1 ./ (parameters(1,2).^2) .* exp(-parameters(1,1) .* parameters(1,2) .* parameters(1,4) - ((parameters(1,1).^2) .* obj.Data(i) .* 0.5)) .* transformation(i)
        end

        function dy = fy(obj, alpha, beta)
        %myFun - Description
            bandera = 0;
            point = obj.Data ./ (alpha.^2)
            evaluation = []
            stepn = 0;
            while bandera == 0;
                stepn = stepn+1;
                evaluation(stepn) = pi .* stepn .* exp(-(stepn).^2 .* (pi).^2 .* 0.5 .* point) .* sin(stepn .* pi .* beta);;
                if stepn > 1;
                    if abs(evaluation(stepn - 1)-evaluation(stepn)) <= 0.00001;
                        dy = sum(evaluation);
                        bandera = 1;
                    else
                        bandera = 0;
                    end
                else 
                    bandera = 0;
                end
            end
        end
        
        % Probability density log kernel
        function logknl = logPdfKernel(obj, parameters)
            logknl = log(pdfKernel(obj, parameters));
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
