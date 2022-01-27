classdef Norm2d
    %NORM2D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} = 0
        Covariance(2,2) double {mustBeReal} = 0
    end
    
    methods
        
        function obj = set.Mean(obj, val)
            obj.Mean = val
        end
        
        function obj = set.Covariance(obj, val)
            obj.Covariance = val
        end
        
        function obj = Norm2d(mu, sigma)
            if nargin > 0
                obj.Mean = mu;
                if nargin > 1
                    obj.Covariance = sigma;
                end
            end
            
        end
        
        function obj = pdf(x, mu, sigma)
            
        end
        
        function obj = log_pdf(x, mu, sigma)
           
        end
        
        function obj = cdf(x, mu, sigma)
            
        end
        
        function obj = log_cdf(x, mu, sigma)
           
        end
        
        function obj = rng(mu, sigma, size)
           
        end
        
        function obj = deviance(data, mu, sigma)
            
        end
    end
end


