classdef Norm2d
    % Bivariate normal likelihood equivalence class
    properties
% validate properties from the start and set default value to (0,0) can use default check for real
        Mean (2,1) double {mustBeReal,mustBeFinite} zeros(2,1);
% validate properties of covariance matrix from start and set default value
        Covariance (2,2) double {mustBeSymm(Covariance),mustBeFinite,mustBeReal,mustBeInvertible(Covariance)} eye(2);
    end

% moving Presicion and Correlation to private properties
    properties (SetAccess = private)
        Precision
        Correlation 
    end 
    % Public methods
    methods
        % Constructor
        function obj = Norm2d(mu,sigma)
            % May need to do this as varargin
            % Set default values
            if nargin < 1
                mu = [0;0];
                sigma = ones(2);
            elseif nargin < 2
                sigma = ones(2);
            end

            % Set up obj
            obj.Mean = 0;
            obj.Covariance = 0;
            
            % Set values
            obj = set.Mean(obj,mu);
            obj = set.Covar(obj,sigma);
        end

        % Getters
        function meanOut = get.Mean(obj)
            meanOut = obj.Mean;
        end
        function covarOut = get.Covariance(obj)
            covarOut = obj.Covariance;
        end
        function precisionOut = get.Precision(obj)
            precisionOut = obj.Precision;
        end
        function corrOut = get.Correlation(obj)
            corrOut = obj.Correlation;
        end
        
        % Setters
        function obj = set.Mean(obj,val)
%             if size(val) ~= [2,2]
%                 check = FALSE;
%                 while check == FALSE
%                     % check
%                     if size(val) == [2,2]
%                         check = TRUE;
%                     end
%                 end
%             end
            
            verifyMean(val);
            obj.Mean = val;
            obj = updateMean(obj); % Derivatives
        end
        function obj = set.Covariance(obj,val)
            verifySigma(val);
            obj.Covariance = val;
            obj = updateCovar(obj);
        end
    end
    
    % Hidden methods
    methods (Access = private)
        % Update derivative values
        function obj = updateMean(obj)
            % Recalculate values that rely on obj.Mean
            
        end
        function obj = updateCovar(obj)
            % Recalculate values that rely on obj.Covariance
            % Precision is the inverse of Covar
                % Make sure it is invertible first!!
            obj.Precision = inv(obj.Covariance);
            obj.Correlation = obj.Covariance(1,2) / sqrt(obj.Covariance(1,1) * obj.Covariance(2,2));
        end
        
        % Validate inputs
        function verifyMean(Mu)
            % Cannot take strings etc
            checkNumber(Mu,"Mu");
            % Must be 2*1 in size
            if ~isequal(size(Mu),[2,1])
                error("Error: Mean (mu) must be a 2x1 vector.");
            end
            % Must be real
            checkReal(Mu,"Mu");
            % Must not be infinity
            checkInf(Mu,"Mu");
            % If you can get to this point, it should be good
        end
        function verifySigma(Sigma)
            % Cannot take strings etc
            checkNumber(Sigma,"Sigma");
            % Must be 2*2 in size
            if ~isequal(size(Mu),[2,2])
                error("Error: Sigma must be a 2x2 matrix.");
            end
            % Must be real
            checkReal(Sigma,"Sigma");
            % Must not be infinity
            checkInf(Sigma,"Sigma");
            % If you can get to this point, it should be good
        end
        function verifyX(X)
            % Cannot take strings etc
            checkNumber(X,"X");
            % Must be 2*n in size
            A = size(X);
            if size(A) > 2
                error("Error: X has more than two dimensions.")
            elseif A(1) ~= 2
                error("Error: X must have two rows.")
            end
            % Must not have infinite values
            checkInf(X,"X");
            % Must not have imaginary values
            checkReal(X,"X");
        end
        function verifySize(dimMat)
            % calling it dimMat since size() is a built-in function
            % Cannot take strings etc
            checkNumber(dimMat,"size");
            % Can't take 3+ dimensions
            A = size(dimMat);
            if size(A) > 2
                error("Error: Size has more than two dimensions.")
            end
            % Must not have infinite values
            checkInf(dimMat,"size");
            % Must not have imaginary values
            checkReal(dimMat,"size");
        end

    end
end
