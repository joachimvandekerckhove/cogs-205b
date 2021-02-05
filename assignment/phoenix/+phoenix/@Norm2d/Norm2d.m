classdef Norm2d
% NORM2D: A class for the bivariate normal (BVN) distribution

    % Properties: Mean, Covariance (default)
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} = [0 0]'
        Covariance(2,2) double {mustBeReal, mustBeFinite, mustBePosDef(Covariance), mustBeSymm(Covariance)} = [1 0.5; 0.5 1]
    end
    
    % Internally set derived properties
    properties (SetAccess = private)
        Precision
	Correlation
	scaleValue
    end
    
    % Methods
    methods

        % Constructor: assign new values to properties
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % Set mean using input
                obj.Mean = Mean;
                if nargin > 1
                    % Set covariance using input
                    obj.Covariance = Covariance;
                end
            end
	    %update precision and correlation
	    obj = updateInternalProperties(obj);
        end
       
        
        % Print the distribution to screen
        function disp(obj)
            fprintf(['phoenix.Norm2d(', mat2str(obj.Mean), ',',mat2str(obj.Covariance),')\n']);
        end
        
        
        %Setter for Mean
	function obj = set.Mean(obj, val)
	    %set value
	    obj.Mean = val;
	end

	% Setter for Covariance Matrix
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateInternalProperties(obj);
        end
        
    end
         
end
