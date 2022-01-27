classdef Norm2d
    %NORM2D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} = 0 %the default to be 2x1 matrix (suggestion: eye(2,1))
        Covariance(2,2) double {mustBeReal} = 0 %set the default to be a 2x2 matrix (suggestion: eye(2,2))
        %make sure to add something that checks that the covariances in the
        %covariance matrix are the same!
    end
    
    %add precision (the first failed I got for when I ran the test suite for your code 
    % is related to no precision property), correlation, and maybe standard deviation as properties
    %(that are derived from the original properties)
    %these should be a in a different section than the mean and covariance properties
    
    
    methods
        
        function obj = set.Mean(obj, val)
            obj.Mean = val
        end
        
        function obj = set.Covariance(obj, val)
            obj.Covariance = val
        end
        
        
        function obj = Norm2d(mu, sigma)
            if nargin > 0
                obj.Mean = mu; %mean should be a set to a 2x1 matrix
                if nargin > 1
                    obj.Covariance = sigma; %covariance needs to be set to a 2x2 covariance matrix
                end
            end
            %need an updater for the properties that are based on
            %covariance
        end

        %below is somethign you could use as your Norm2d constructor 
%         
%         function obj = Norm2d(Mean, Covariance)
%             if nargin > 0
%                 obj.Mean = Mean;
%                 if nargin > 1
%                     obj.Covariance = Covariance;
%                 end
%             end
%             
%            obj = updateCovariance(obj);
% 
%             
%         end
        
        %you are so brave for making your own pdf function!
        %joachim suggested that I just clone the Normal.m file from the
        %assignment folder and then make changes on there (since the
        %Normal.m file isn't perfect)
        
                       
        % Probability density function FROM JOACHIM'S NORMAL.M
        function yax = pdf(obj, xax)
            yax = obj.ScalingConstant ...
                * obj.Precision ...
                * pdfKernel(obj, xax);
        end
        
        function out_pdf = pdf(x, mu, sigma) %need to input 
            x1 = x(1,:) 
            x2 = x(2,:)
            m1 = mu(1)
            m2 = mu(2)
            sig1 = sigma(1)
            sig2 = sigma(2)
            p = obj.Covariance/sig1*sig2
            z = (x1-m1/sig1)^2-2*p*((x1-m1)/sig1)*((x2-m2)/sig2)+((x2-m2)/sig2)^2
            out_pdf = 1/2*pi*sig1*sig2*sqrt(1-p^2)*exp((-1/2)*(z/(1-p^2))) 
        end
        
        function obj = log_pdf(x, mu, sigma, out_pdf) 
            %if out_pdf is the input, i don't think you need to repeat the x, mu, and sigma
            %as inputs 
           obj = log(out_pdf) 
        end
        

        
        function out_cdf = cdf(x, mu, sigma)
            out_cdf = mvncdf(x, mu, sigma)
        end
        
        function obj = log_cdf(x, mu, sigma)
           obj = log(out_cdf)
        end
        
        function obj = rng(mu, sigma, size)
           % struggling with rng, will continue to work on it
        end
        
        % Random number generator from Joachim's code. Don't use this as-is bc
        % its not correct without some tweaking 
        function x = rnd(obj, dims)            
            if nargin < 2, dims = 1; end            
            x = obj.unstandardize(randn(dims));            
        end
        
        function obj = deviance(data, mu, sigma)
            % this one too
            obj = -2*(log_pdf(data, mu, sigma))
           
        end
    end
end



