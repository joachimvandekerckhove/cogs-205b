classdef Norm2d
    % NORM2D: A class for the bivariate normal distribution

    % The main properties are the means and covariance
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite, mustBe2by1(Mean)} = [0; 0]
        Covariance (2,2) double {mustBeReal, mustBeFinite, mustBeSymmetric(Covariance)} = ...
            [1 0.5; 0.5 1]
    end

  % Derived properties that need to be set internally
  properties (SetAccess = private)
        Precision double {mustBeReal} 
        Correlation double {mustBeReal, mustBeFinite} 
  end

  % Constant properties
  properties(Constant)
      % Gaussian scaling constant
      ScalingConstant = (2*pi).^(-0.5);
      % Distribution name
      Name = 'Bivariate Normal';
  end

  % Define methods for this class
  methods

      %%% Constructor for a new (user-specified) bivariate normal %%%
      function obj = Norm2d(Mean, Covariance)
          if nargin > 0
              obj.Mean = Mean;
          end
              if nargin > 1
                  obj.Covariance = Covariance;
              end
          obj = updateCovariance(obj);
      end

      %%% Display function %%%
      % print the distribution to the screen (by overloading - yay!)
      function disp(obj)
          fprintf('  %s distribution with parameters:\n', obj.Name);
          fprintf('         %s\n\t %f \n\t %f \n' , 'Mean:', obj.Mean);
          fprintf('         %s\n\t %f   %f\n\t %f   %f\n' , 'Covariance:', obj.Covariance');
          fprintf('\n');
      end
        

           
      %%% Getters & setters %%%

      % Setter for Covariance
      function obj = set.Covariance(obj, val)
          % set new covariance
          obj.Covariance = val;
          % update contingent properties (precision & correlation)
          obj = updateCovariance(obj);
      end

      % Update properties contingent on Covariance
      function obj = updateCovariance(obj)
          obj.Precision = inv(obj.Covariance); 
          obj.Correlation = obj.Covariance(1,2) / sqrt(obj.Covariance(1,1)*obj.Covariance(2,2));
      end


      %%% Computation functions %%%
      % Probability density function
      yax = pdf(obj, xax)

      % Log probability density function
      yax = logpdf(obj, xax)

      % Cumulative distribution function
      yax = cdf(obj, xax)

      % Log cumulative distribution function 
      yax = logcdf(obj, xax)

      % Random number generation
      x = rnd(obj, xax, size)

      % Deviance
      dev = deviance(obj, data)
      
      % standardizer
      z = standardize(obj, xax);

  end

  % Static methods don't need the object as input
    methods (Static)
        testSuite()
        [Mean, Covariance] = estimate(X)
    end
end

% custom validation functions
% ensure mean dimensions
function mustBe2by1(a)
    if size(a, 1) ~= 2 || size(a,2) ~= 1
        eidType = 'mustBe2by1: improper dimensions';
        msgType = 'Mean can only be a 2x1 vector';
        throwAsCaller(MException(eidType, msgType))
    end
end

% ensure covariance matrix symmetry
function mustBeSymmetric(a)
    if ~issymmetric(a)
        eidType = 'mustBeSymmetric: not symmetric';
        msgType = 'Covariance matrix must be symmetric';
        throwAsCaller(MException(eidType, msgType))
    end
end