classdef Norm2d
    %NORM2D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} = [0, 0]
        Covariance(2,2) double {mustBeReal} = [1, 0; 0, 1]
    end
    
    properties (SetAccess = private)
        ScaleFactor
        logScaleFactor 
        Precision double {mustBeReal} 
        Correlation double {mustBeReal, mustBeFinite} 
    end
        
    methods
        
        function obj = set.Mean(obj, val)
            obj.Mean = val;
        end
        
        function obj = set.Covariance(obj, val)
            obj.Covariance = val;
        end
        
        function obj = Norm2d(mu, sigma)
            if nargin > 0
                obj.Mean = mu;
                if nargin > 1
                    obj.Covariance = sigma;
                end
            end
            
        end
        
        function out_pdf = pdf(obj, x)
      
            x1 = x(1,1);
            x2 = x(2,1);
            m1 = obj.Mean(1);
            m2 = obj.Mean(2);
            sig1 = sqrt(obj.Covariance(1, 1));
            sig2 = sqrt(obj.Covariance(2, 2));
            p = obj.Correlation;
            z = (x1-m1/sig1)^2-2*p*((x1-m1)/sig1).*((x2-m2)/sig2)+((x2-m2)/sig2).^2;
            out_pdf = 1/2*pi*sig1*sig2*sqrt(1-p^2)*exp((-1/2).*(z/(1-p^2)));
        end
          
        
        function obj = log_pdf(x, mu, sigma, out_pdf)
           obj = log(out_pdf);
        end
        
        function out_cdf = cdf(x, mu, sigma)
            out_cdf = mvncdf(x, mu, sigma);
        end
        
        function obj = log_cdf(x, mu, sigma)
           obj = log(out_cdf);
        end
        
        function obj = rnd(obj, size)
            size = 1;
           

            m1=obj.Mean(1);
            m2=obj.Mean(2);

            s1=sqrt(obj.Covariance(1,1));
            s2=sqrt(obj.Covariance(2,2));

            x1 = s1.* randn(1, size) + m1;

            x2 = (s2^2*sqrt(1-obj.Correlation)) .* randn(1, size) ...
                + (m2 + s2*obj.Correlation*((x1-m1)./s1));

            x = vertcat(x1, x2);
        end
        
        function obj = deviance(data, mu, sigma)
  
            obj = -2*(log_pdf(data, mu, sigma));
           
        end
    end
    
    methods (Static)
        
        function obj = estimate(X)
            
            Mean = mean(X, 1);
            Cov = cov(X(:, 1), X(:, 2));
            obj = gmauter.Norm2d(Mean, Cov);
        end
        

        
        
        
        
    end
    

end


