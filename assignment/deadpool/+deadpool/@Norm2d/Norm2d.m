classdef Norm2d
% A class for the 2 dimentional multivariate normal distribution
    properties 
        Mean(2,1) double {mustBeReal,mustBeFinite} = (0,0)
        CovM(2,2) double {mustBeFinite,mustBePositiveSemiDef(CovM),mustBeSimm(CovM)} = eye(2) 
    end

    properties (constant)
        scalingconstant = (2*pi).^(-1);
    end

    properties (SetAccess = private)
        PrecisionM
        Correlation
    end

    methods
        function obj = Normal2d(Mean, CovM)
            if nargin > 0
                % Set mean of 2D MVN
                obj.Mean = Mean;
                if nargin > 1
                    % Set Covariance matrix of 2D MVN
                    obj.CovM = CovM;
                end
            end
            % Update Precision and Correlation after change in Covariance
            obj = updatePresCorM(obj)
        end

        function obj = set.CovM(obj,val)
        %Set New Covariance Matrix
            obj.CovM = val
        % Update Precision and Correlation after change in Covariance
            obj = updatePresCorM(obj)
        end
    end

end