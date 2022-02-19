classdef Norm2d
   
    % NORM2D A class for a bivariate normal distribution

    % The main properties are mean and covariance
    properties 
        Mean(2,1) double{mustBeReal,mustBeFinite} = [0; 0];
        Covariance (2,2) double{mustBeReal, mustBeFinite, mustBeSymmetric(Covariance)} = [1 0.5; 0.5 1];
    end

    % Derived properties that are set internally
    properties (SetAccess = private)
      Precision double {mustBeReal}
      Correlation double {mustBeReal, mustBeFinite}
    end

    % Constant properties
    properties(Constant)
        % Gaussian scaling constant
        ScalingConstant = (2*pi) .^(-0.5);
        % Distribution name
        Name = 'Bivariate Normal';
    end

    % Define methods for this class
    methods

    %%% Constructor method builds the object %%%
    function obj = Norm2d(Mean, Covariance)
        if nargin > 0
            obj.Mean = Mean;
            if nargin >1 
                obj.Covariance = Covariance;
            end
        end
        obj = updateCovariance(obj);
    end

    %%% Display function %%% 
    % prints the distribution properties to the screen (by overloading!)
    function disp(obj)
          fprintf('  %s distribution with parameters:\n', obj.Name);
          fprintf('         %s\n\t %f \n\t %f \n' , 'Mean:', obj.Mean);
          fprintf('         %s\n\t %f   %f\n\t %f   %f\n' , 'Covariance:', obj.Covariance');
          fprintf('\n');
    end

    %%% Getters & setters %%%

    % Setter for Covariance
    function obj = set.Covariance(obj, val)
        obj.Covariance = val;
        obj = updateCovariance(obj);
    end


    % Update properties contingent on covariance
    function obj = updateCovariance(obj)
        obj.Precision = inv(obj.Covariance);
        obj.Correlation = obj.Covariance(1,2) / sqrt(obj.Covariance(1)*obj.Covariance(4));
    end

    
    %%% Computation functions %%%

   % Probability density function
    output = pdf(obj, X)

   % Log probability density function
   output = logpdf(obj, X)

   % Cumulative distribution function
   output = cdf(obj, x)

   % Log cumulative distribution function
   output = logcdf(obj, X)

   % Random number generation
   output = rnd(obj, X)

   % Deviance
   output = deviance(obj, X)

   % Standardizer
   output = standardize(obj, X)
    end
    methods(Static)
        obj=estimate(data)
    end
    
end

% custom validation function
% ensure covariance symmetry
function mustBeSymmetric(a)
    if ~issymmetric(a)
        eidType = 'mustBeSymmetric: not symmetric';
        msgType = 'Covariance matrix must be symmetric';
        throwAsCaller(MEception(eidType, msgType))
    end
end

    


