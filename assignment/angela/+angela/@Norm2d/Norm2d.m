classdef Norm2d
    
    properties
        
        Mean (2,1) double {mustBeReal, mustBeFinite} ...
            = [0;0]
        Covariance (2,2) double {mustBeReal, mustBeFinite, ...
            mustBeNonnegative, mustBeSymmetric(Covariance)} ...
            = [1 0;0 1]
        
    end
    
    % derived properties that are set internally
    properties (SetAccess = private)
        
        Precision 
        Correlation 
        
    end
    
    
    methods
        
        %%% constructor function %%%
        function obj = Norm2d(Mu, Sigma)
            
            if nargin > 0
                
                obj.Mean = Mu;
                
                if nargin > 1
                    obj.Covariance = Sigma;
                end
                
            end
            obj = updateProperties(obj);
        end
        
        
        %%% getters and setters %%%
        
        % setter for mean
        function obj = set.Mean(obj, val)
            obj.Mean = val;
        end
        
        % setter for covariance
        function obj = set.Covariance(obj, val)
            
            obj.Covariance = val;
            % update contingent properties
            obj = updateProperties(obj);
        end
        
        
        % updater for precision and correlation
        function obj = updateProperties(obj)
            obj.Precision = pinv(obj.Covariance);
            
            c12 = obj.Covariance(3);
            sigma1 = sqrt(obj.Covariance(1));
            sigma2 = sqrt(obj.Covariance(4));
            
            obj.Correlation = c12./(sigma1*sigma2);
        end
        
        
        %%% computation functions / ordinary methods %%%
        
        % probability density function
        yax = pdf(obj,X)
        
        % log probability density function
        yax = logpdf(obj,X)

        % cumulative distribution function
        yax = cdf(obj,X)
        
        % log cumulative distribution function
        yax = logcdf(obj,X)
        
        % random number generator
        x = rnd(obj,size)
        
        % deviance
        yax = deviance(obj,X)
        
        
        %%% methods that make life easier %%%
        
        % standardize a 2 x n variate
        z = standardize(obj,X)
        
        % gaussian exponent term
        a = expTerm(obj, z)
        
    end
    
    methods (Static)
        
        obj = estimate(data)
        
    end
    
end

% check for symmetry
function mustBeSymmetric(a)
    if ~issymmetric(a)
        eidType = 'mustBeSymmetric:notSymmetric';
        msgType = 'Input must be symmetric.';
        throwAsCaller(MException(eidType,msgType))
    end    
end
