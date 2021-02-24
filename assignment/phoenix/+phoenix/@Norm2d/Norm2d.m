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

    methods (Static)
	function dataObj = estimate(dat)
		% INPUT: 2xn matrix of data
		% OUTPUT: Norm2d object with sample mean and sample variance
		arguments
			dat {mustBeReal, mustBeFinite}
		end

	        %Transpose data if necessary to be 2xn
        	if size(dat,2) == 2
           		dat = dat';
        	end

		%There should be enough data 
		if size(dat,2) < 5
                	warning("Sample size very small (less than 5 observations.)")
        	end


		nObs = size(dat,2);
		sampleMean = mean(dat,2);
		varTerms = @(a,m,n) sum((a-m).^2)/(n-1);
                cvTerms = @(d,m,n) sum((d(1,:)-m(1)).*(d(2,:)-m(2)))/(n-1);
		sampleCov = [varTerms(dat(1,:),sampleMean(1),nObs) cvTerms(dat,sampleMean,nObs); ...
			     cvTerms(dat,sampleMean,nObs) varTerms(dat(2,:),sampleMean(2),nObs)];

		dataObj = phoenix.Norm2d(sampleMean,sampleCov);
		dataObj = updateInternalProperties(dataObj);
		%fprintf("Bivariate Normal object created\n")

	end
    end


    
    
end
