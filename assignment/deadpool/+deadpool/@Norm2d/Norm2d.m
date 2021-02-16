classdef Norm2d
% A class for the 2 dimentional multivariate normal distribution
    properties 
        Mean (2,1) double {mustBeReal,mustBeFinite} = zeros(2,1);
        Covariance (2,2) double {mustBeFinite,mustBePositiveDef(Covariance),mustBeSimm(Covariance)} = eye(2);
    end

    properties (Constant)
        scalingConstant = (2*pi).^(-1);
    end

    properties (SetAccess = private)
        Precision;
        Correlation;
        determinant;
        invsqrtdet;
        loginvsqrtdet;
    end

    methods
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % Set mean of 2D MVN
                obj.Mean = Mean;
                if nargin > 1
                    % Set Covariance matrix of 2D MVN
                    obj.Covariance = Covariance;
                end
            end
            % Update Precision and Correlation after change in Covariance
            obj = updatePresCorM(obj);
        end

        function obj = set.Covariance(obj,val)
        %Set New Covariance Matrix
            obj.Covariance = val;
        % Update Precision and Correlation after change in Covariance
            obj = updatePresCorM(obj);
        end
    end

% Static methods 
    methods (Static)
    % Estimation of mean and covariance of a sample.
        function newObj = estimate(data)
            bar_x = estimate_mean(data);
            s_2 = estimate_covariance(data);
            newObj = Norm2d(bar_x,s_2)
        end
    end
end