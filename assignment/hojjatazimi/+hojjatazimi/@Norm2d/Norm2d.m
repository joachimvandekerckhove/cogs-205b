classdef Norm2d
    
    properties
       
        Mean(2, 1) double {mustBeReal, mustBeFinite, size} = zeros(2, 1)
        Covariance(2, 2) double {mustBeReal, mustBeFinite} = eye(2)
        
    end

    properties (SetAccess=private)
       
        Correlation;
        Precision; 
        ScaleFactor;
        logScaleFactor;

    end
    
    methods

%        Constructor
        function obj = Norm2d(Mean,Covariance)
            if nargin == 2
                mean_size = size(Mean);
                cov_size = size(Covariance);
                if mean_size(1) == cov_size 
                    obj.Mean = Mean;
                    obj.Covariance = Covariance;
                else
                    error('Mean and Sgima must be the same size!')
                end
            elseif nargin == 1
                mean_size = size(Mean);
                obj.Mean = Mean;
                obj.Covariance = eye(mean_size);
                obj = triggerCovariance(obj);
            end
            obj = triggerCovariance(obj);
        end

%       Setters
        function obj = set.Mean(obj, Mean)
            if size(Mean) == size(obj.Mean)
                obj.Mean = Mean;
            else
                error ('wrong size')
            end
        end

        function obj = set.Covariance(obj, Covariance)
            if size(Covariance) == size(obj.Covariance)
                if Covariance == Covariance.'
                    try 
                        chol(Covariance);
                        obj.Covariance = Covariance;
                        obj = triggerCovariance(obj);
                    catch
                        error ('Must be Positive Infinite')
                    end
                else
                    error('Must Be Symmetric!')
                end
            else
                error ('wrong size')
            end
        end

        function obj = triggerCovariance(obj) 
            obj.Correlation = obj.Covariance(1, 2)/(sqrt(obj.Covariance(1, 1))*sqrt(obj.Covariance(2, 2)));
            obj.Precision = inv(obj.Covariance);
        end

%       Getters
        function Mean = get.Mean(obj)
            Mean = obj.Mean;
        end
        function Covariance = get.Covariance(obj)
            Covariance = obj.Covariance;
        end
        function Precision = get.Precision(obj)
            Precision = obj.Precision;
        end
        function Correlation = get.Correlation(obj)
            Correlation = obj.Correlation;
        end  

%       Methods

        out = pdf(obj, X)

        out = logpdf(obj, X)
           
        out = cdf(obj, X)

        out = logcdf(obj, X)

        out = rnd(obj, size)

        out = deviance(obj, data)

    end

    methods (Static)
        out = estimate (X)
        
    end
end