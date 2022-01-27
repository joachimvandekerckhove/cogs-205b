classdef Norm2d
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    properties
        
        Mean {mustBeReal, mustBeFinite, size} = zeros(2, 1)
        Covariance {mustBeReal, mustBeFinite} = eye(2)
        
    end
    properties (SetAccess=private)
        Correlation;
        Precision; 
    end
    
    methods
%         Constructor
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
%         Setters
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
%         Getters
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
%         Methods
        function out = pdf(obj, X)

            sig_1 = sqrt(obj.Covariance(1));
            sig_2 = sqrt(obj.Covariance(4));

            z_1 = power((X(1, :) - obj.Mean(1))/sig_1, 2);
            z_2 = -2 * obj.Correlation * ((X(1, :) - obj.Mean(1))/sig_1) .* ((X(2, :) - obj.Mean(2))/sig_2);
            z_3 = power( (X(2, :) - obj.Mean(2))/sig_2 , 2);
            z = z_1 + z_2 + z_3;
        
            scale = 1 / (2 * pi * sig_1 * sig_2 * sqrt(1 - power(obj.Correlation, 2)));

            out = scale * exp(-.5 * z / (1-power(obj.Correlation, 2)));

        end
        function out = logpdf(obj, X)
            sig_1 = sqrt(obj.Covariance(1));
            sig_2 = sqrt(obj.Covariance(4));

            z_1 = power((X(1, :) - obj.Mean(1))/sig_1, 2);
            z_2 = -2 * obj.Correlation * ((X(1, :) - obj.Mean(1))/sig_1) .* ((X(2, :) - obj.Mean(2))/sig_2);
            z_3 = power( (X(2, :) - obj.Mean(2))/sig_2 , 2);
            z = z_1 + z_2 + z_3;
        
            logscale = log (1 / (2 * pi * sig_1 * sig_2 * sqrt(1 - power(obj.Correlation, 2))));

            out = logscale + (-.5 * z / (1-power(obj.Correlation, 2)));
        end
        function out = cdf(obj, X)
            try
                out = mvncdf(X, obj.Mean', obj.Covariance)';
            catch
                out = mvncdf(X', obj.Mean', obj.Covariance)';
            end
        end
        function out = logcdf(obj, X)
            try
                out = log(mvncdf(X, obj.Mean, obj.Covariance));
            catch
                error('wrong input')
            end
        end
        function out = rnd(obj, size)
            m_1 = obj.Mean(1);
            m_2 = obj.Mean(2);
            s_1 = sqrt(obj.Covariance(1));
            s_2 = sqrt(obj.Covariance(4));
            x_1 = normrnd(m_1, s_1, 2, size);
            x_2 = normrnd(m_2 + (s_2*obj.Correlation*(x_1-m_1)/s_1), power(s_2, 2)*sqrt(1-power(obj.Correlation, 2)), 2, size);
            out = x_2;
        end
        function out = deviance(obj, data)
            tmp = obj.logpdf(data);
            out = sum(tmp, 'all');
        end
    end
end

