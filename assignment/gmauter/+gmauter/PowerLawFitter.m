classdef PowerLawFitter < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ObservedRT % row vector of observed mean reaction times over N trials
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
        
        function obj = Expectation(A, B, E, beta)
         
            %   output is ERT, a vector of expected reaction times over N
            %   trials where N is count
            obj = ERT
        end
        
        function outputArg = SumOfSquaredError(A, B, E, beta)
            %   output is SSE, a scalar that is the squared difference
            %   between ERT and ObservedRT, summed
            outputArg = SSE
        end
        
        function Fit()
            % after running fit, the private access properties should be
            % set to be the estimated parameters of the power law to these
            % data
            
        end
        
        function disp()
           % prints to the screen information about the current data, such
           % as the number of trials and also parameter estimates if they
           % are available.
        end
    end
end

