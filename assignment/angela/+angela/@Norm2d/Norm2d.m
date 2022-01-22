classdef Norm2d
    
    properties
        
        Mean (2,1) double {mustBeReal, mustBeFinite} ...
            = [0;0]
        Covariance (2,2) double {mustBeReal, mustBeFinite, ...
            mustBePositive, mustBeSymmetric(Covariance)} ...
            = [1 0.1;0.1 1]
        
    end
    
    % derived properties that are set internally
    properties (SetAccess = private)
        
        Precision (2,2) double
        Correlation (1,1) double
        
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
        
        output1 = pdf(X,Mu,Sigma)
        
        output2 = logpdf(X,Mu,Sigma)
        
        output3 = cdf(X,Mu,Sigma)
        
        output4 = logcdf(X,Mu,Sigma)
        
        output5 = rng(Mu,Sigma,size)
        
        output6 = deviance(Data,Mu,Sigma)
        
        

        
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
