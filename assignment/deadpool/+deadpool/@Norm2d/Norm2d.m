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
            newObj = deadpool.Norm2d();
            bar_x = newObj.estimate_mean(data);
            newObj.Mean = bar_x; 
            s_2 = newObj.estimate_covariance(data);
            newObj.Covariance = s_2;
        end

        function barMu = estimate_mean(data)
            % This function takes a 2xN matrix and returns an object of the class
            % Norm2d with mean vector equal to the mean of the rows and a Covariance matrix.
            
                % Check properties of the data matrix
            Check_data(data);
            
                % Estimate mean of the rows
            barMu = mean(data,2);
        end

        function barSigma = estimate_covariance(data)
            % This function takes a 2xN matrix and returns an object of the Covariance Matrix
            % of a Norm2d class object.
            
                % Check Properties of the data matrix
            Check_data(data);
            
                % Number of observations
            N = size(data,2);
            
                % vector for centered variables
            z = zeros(2,N);
            
            % Calculating mean of sample
            xbar = mean(data,2);
            
                % Center observations
            for i = 1:N
                z(:,i) = data(:,i) - xbar;
            end
            
            % Estimate Covariance Matrix
            barSigma = 1./(N-1) .* (z * z.');
        end
    end
end