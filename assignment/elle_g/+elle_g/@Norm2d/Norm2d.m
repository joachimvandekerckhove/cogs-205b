classdef Norm2d
    % Norm2d  A class for the normal distribution
    
    % The main properties are the mean and standard deviation ~~how to make
    % sure covariance(1, 2) matches (2, 1)
    properties
        Mean (2, 1) double {mustBeReal, mustBeFinite} ...
            = eye(2,1)
        Covariance (2, 2) double {mustBeReal, mustBeFinite, covarianceValueCheck(Covariance)} ...
            = eye(2)
%         Covariance (2, 2) double {mustBeReal, mustBeFinite} ...
%             = eye(2)
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Correlation
        StandardDeviation
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
        Name = 'Norm2d';
    end
    
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Norm2d
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            
            f = '     %s  %-20s= %8.4f \t %8.4f \n';
            F = '     %s  %-20s= %8.4f \t %8.4f \n \t\t\t%8.4f\t%8.4f';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , obj.Mean           );
            fprintf(F, b, 'Covariance', obj.Covariance );
            
            fprintf('\n');
            
        end
        
       
        
        
        %%% Getters and setters %%%
        
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            obj.Covariance=val;
            %update contingent properties
            obj= updateCovariance(obj);
           
        end 
        
        % Updater for covariance
       
        function obj = updateCovariance(obj)
            obj.Correlation=obj.Covariance(1,2)./(sqrt(obj.Covariance(1, 1)).*sqrt(obj.Covariance(2, 2)));
            obj.Precision=inv(obj.Covariance);
            obj.StandardDeviation=sqrt(diag(obj.Covariance));
        end 
  
        
        
        % Setter for Mean
        function obj = set.Mean(obj, val)
            % Set the value
            obj.Mean = val;
        end
        
        %Getter for Covariance
        function val = get.Covariance(obj)
            val=obj.Covariance;
        end 
        
        %Getter for Mean
        function val = get.Mean(obj)
            val=obj.Mean;
        end
        
        %Getter for Precision
        function val = get.Precision(obj)
            val=obj.Precision;
        end
        
        %Getter for Correlation
        function val = get.Correlation(obj)
            val=obj.Correlation;
        end
        
        % Computation functions
        
        % Cumulative distribution function
        function yax = cdf(obj, xax)
            zax = obj.standardize(xax);
            yax = 0.5 * (1 + erf(zax ./ sqrt(2)));
        end
        
        % Log Cumulative density function
        function yax = logCdf(obj, xax)
            yax=log(obj.cdf(xax));          % changed n to xax here
        end
       
        % Probability density function
        function yax = pdf(obj, xax)
            yax = obj.ScalingConstant ...
                * obj.Precision ...
                * pdfKernel(obj, xax);
        end
        
        % Log Probability density function
        function yax = logPdf(obj, xax)
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(xax);
        end
        
        % Deviance score function
        function yax = deviance(obj, data, parameters)
            obj.Mean              = parameters(1);
            obj.StandardDeviation = parameters(2);
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(data);
        end
        
        % Probability density kernel
        function knl = pdfKernel(obj, xax)     
            knl = exp(logPdfKernel(obj, xax));
        end
        
        % Probability density log kernel
        function knl = logPdfKernel(obj, xax) 
            zax = obj.standardize(xax);
            knl =  -0.5 * zax.^2;
        end        
        
        % Random number generator
        function x = rnd(obj, dims)            
            if nargin < 2, dims = 1; end            
            x = obj.unstandardize(randn(dims));            
        end
        
        % Standardize a variate
        function z = standardize(obj, x)
            z = (x - obj.Mean) ./ obj.StandardDeviation;
        end
        
        % Unstandardize a variate
        function [x1, x2] = unstandardize(obj, z)
            x1 = obj.Mean(1,1) + z .* obj.StandardDeviation(1,1);
            x2=obj.Mean(2,1) + z .* obj.StandardDeviation(2,1);
        end
        
        % Integrate a function over this distribution
        function A = integrateOver(obj, fcn)
            
            w = [ 2.22939E-13  4.39934E-10  1.08607E-7  7.80256E-6  2.28339E-4 ...
                0.00324377   0.0248105    0.109017    0.286676    0.462244   ...
                0.462244     0.286676     0.109017    0.0248105   0.00324377 ...
                2.28339E-4   7.80256E-6   1.08607E-7  4.39934E-10 2.22939E-13];
            
            x = [ -5.38748  -4.60368  -3.94476  -3.34785  -2.78881  ...
                -2.25497  -1.73854  -1.23408  -0.73747  -0.24534  ...
                0.24534   0.73747   1.23408   1.73854   2.25497  ....
                2.78881   3.34785   3.94476   4.60368   5.38748];
            
            A = sum(fcn(x * sqrt(2) * obj.StandardDeviation + obj.Mean) ./ sqrt(pi) .* w);
            
        end
        
    end
    
end

      %validator for covariance values
        function covarianceValueCheck(Covariance)
            [~,bool] = chol(Covariance);
            if bool == 1 || ~(Covariance(1,2) == Covariance(2,1))
                % cholesky factorization checks for positive definite and symmetry
                eidType = 'covarianceValueCheck:notcovarianceValueCheck';
                msgType = 'The covariance values row 1 col 2 and row 2 col 1 of the covariance matrix must be equal.';
                throwAsCaller(MException(eidType,msgType))
            end
        end

