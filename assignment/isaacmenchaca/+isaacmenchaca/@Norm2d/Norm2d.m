classdef Norm2d
    properties % variables that belong to the class.
        Mean(2, 1) double {mustBeFinite, mustBeReal} ...
            = [0; 0];
        Covariance(2, 2) double {mustBeFinite, mustBeReal, mustBeSymmetricPositiveDefinite} ...
            = [1 0; 0 1];
    end
    
    properties (SetAccess = private)
        Precision
        Correlation
        
        % adding these.
        sigma1
        sigma2
    end
    
    methods 
        
        function obj = Norm2d(Mu, Sigma)
            if nargin > 0
                obj.Mean = Mu;
                if nargin > 1
                    obj.Covariance = Sigma;
                end
            end 
            
            obj = updateParameters(obj);
        end
        
        % Update Function
        
        function obj = updateParameters(obj)
            obj = updateSigmas(obj);
            obj = updatePrecision(obj);
            obj = updateCorrelation(obj);
        end 
        
        function obj = updatePrecision(obj)
            obj.Precision = inv(obj.Covariance);
        end
        
        function obj = updateCorrelation(obj)
            obj.Correlation = obj.Covariance(2, 1)./(sqrt(obj.Covariance(1,1)*obj.Covariance(2,2)));
        end
        
        function obj = updateSigmas(obj)
            obj.sigma1 = sqrt(obj.Covariance(1, 1));
            obj.sigma2 = sqrt(obj.Covariance(2, 2));
        end 
      
        % SETTERS
        
        function obj = set.Mean(obj, val)
            obj.Mean = val;
        end
        
        function obj = set.Covariance(obj, val)
            obj.Covariance = val;
            obj = updateParameters(obj);
        end
        
        % Ordinary Methods
        z = standardized(obj, X);
        yax = pdf(obj, X);
        yax = logpdf(obj, X);
        yax = cdf(obj, X)
        yax = logcdf(obj, X);
        x = rnd(obj, X);
      
        
    end
end

function mustBeSymmetricPositiveDefinite(testCovariance)
    if ~chol(testCovariance)
        ME = MException('Convariance: NotSymmetricPositiveDefinite', ...
            'Covariance matrix is not symmetric positive definite.');
        throw(ME)
    end
end
