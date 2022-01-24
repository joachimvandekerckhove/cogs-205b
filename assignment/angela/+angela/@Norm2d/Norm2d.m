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
        
        Precision (2,2) double {mustBeFinite}
        Correlation (1,1) double {mustBeFinite}
        
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
            obj.Precision = inv(obj.Covariance);
            
            c12 = obj.Covariance(3);
            sigma1 = sqrt(obj.Covariance(1));
            sigma2 = sqrt(obj.Covariance(4));
            
            obj.Correlation = c12./(sigma1*sigma2);
        end
        
        
        %%% computation functions / ordinary methods %%%
        
        output1 = pdf(obj,X)
        
        output2 = logpdf(obj,X)
        
        output3 = cdf(obj,X)
        
        output4 = logcdf(obj,X)
        
        output5 = rng(obj,size)
        
        output6 = deviance(obj,X)
        
        output7 = rnd(obj, size)
        
        
        %%% things that make life easier %%%
        
        % standardize a 2 x n variate
        z = standardize(obj,X)
        
        % gaussian exponent term
        a = expTerm(obj, z)
        
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
