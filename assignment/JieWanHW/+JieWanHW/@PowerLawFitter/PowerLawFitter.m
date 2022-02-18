% This is a bivariate normal likelihood equivalence class. It has the properties: Mean, Covariamce, Precision, Std, Correlation; It has getters and setters and 6 main methods: cdf, deviance, pdf, rnd, logcdf, logpdf; as well as 1 main static methods: estimate.

classdef PowerLawFitter < handle
	
	properties
		ObservedRT double {mustBeReal, mustBeFinite, mustBePositive} = [2, 1]  %mustBeNew
    end

    properties (Dependent)
        Count
    end

	properties	(SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
	end

	methods        
        %%% Constructor function %%%

        % A main constructor, for a new 
        function obj = PowerLawFitter(ObservedRT)
            if nargin > 0
                 % This triggers the explicit setter for ObservedRT
%                 if obj.EstimatedAsymptote
%                     if ObservedRT == obj.ObservedRT
%                         disp('You already estimated the parameters, no need to run Fit again.')
%                     else
%                         obj.ObservedRT = ObservedRT;
%                         a=2
%                     end
%                 else
%                     a=3
                    obj.ObservedRT = ObservedRT;
%                 end
            else
                error('set:NoInputValue','Input value required.')
            end
        end

	    %%% Getters and setters %%%
        function obj = set.ObservedRT(obj, val)
            if isequal(obj.ObservedRT,val)
                disp('You already estimated the parameters, no need to run Fit again.')
            else
                % Set the value
                obj.ObservedRT = val;
                % Update contingent properties
                %Fit(obj); this works but the following is more elegant
                obj.EstimatedAsymptote = [];
                obj.EstimatedRange = [];
                obj.EstimatedExposure = [];
                obj.EstimatedRate = [];
            end
        end

        function value = get.Count(obj)
            value = length(obj.ObservedRT);
        end

    end

end

% function mustBeNew(A) 
%     if (exist('f','var') && isprop(f,'ObservedRT'))
%         c=1;
%         if isequal(A,f.ObservedRT)
%             c=2;
%             throwAsCaller(createValidatorException('MATLAB:validators:mustBeNew'));
%         end
%     end
% end
