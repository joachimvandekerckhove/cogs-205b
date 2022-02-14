classdef PowerLawFitter < handle
    %POWERLAWFITTER 
    
    % Implement at least one test for each property.
    properties
        ObservedRT %need to make sure it is a vector
    end
    
    properties (SetAccess=private)
        Count %dependent on observed RT
        EstimatedAsymptote 
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
    methods
        function obj = %MAKE A CONSTRUCTOR

            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function ERT = Expectation(A, B, E, beta)
            
            outputArg = obj.Property1 + inputArg;
        end
        
        function SSE = SumOfSquaredError(A, B, E, beta)
        end
        
        function fit() %no input, no output
            
        end
        
        function disp() %no input, no putput
            
        end
    end 
end

