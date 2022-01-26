classdef Norm2d
    properties % variables that belong to the class.
        Mean(2, 1) double {mustBeFinite, mustBeReal} ...
            = [0; 0];
        Covariance(2, 2) double {mustBeFinite, mustBeReal} ...
            = [0 0; 0 0];
    end
    
    properties (SetAccess = private)
        Precision
        Correlation 
    end
    
    methods 
        
        function obj = Norm2d(Mu, Sigma)
            if nargin > 0
                obj.Mean = Mu;
                if nargin > 1
                    obj.Covariance = Sigma;
                end
            end 
            obj = updatePrecision(obj);
            obj = updateCorrelation(obj);
        end
        
        % Update Function
        function obj = updatePrecision(obj)
            obj.Precision = inv(obj.Covariance);
        end
        
        function obj = updateCorrelation(obj)
            obj.Correlation = obj.Covariance(2, 1)./(sqrt(obj.Covariance(1,1)*obj.Covariance(2,2)));
        end
      
        % SETTERS
        
        function obj = set.Mean(obj, val)
            obj.Mean = val;
        end
        
        function obj = set.Covariance(obj, val)
            obj.Covariance = val;
            obj = updatePrecision(obj);
            obj = updateCorrelation(obj);
        end
        
        
        
        
    end
end


