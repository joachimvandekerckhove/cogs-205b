classdef PowerLawFitter < handle
    % POWERLAWFITTER: A class for fitting the power law of practice rule

    % Has parameters Asymptote (A), Range (B), Exposure (E), Rate (Beta)

    %% Properties %%
    % User-definable 
    properties 
        ObservedRT (1, :) double {mustBeReal, mustBeFinite} = ...
            [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263]
    end

    % Derived 
    properties (SetAccess = private)
        Count double {mustBeReal, mustBePositive, mustBeFinite, mustBeNonzero, mustBeInteger}
        EstimatedAsymptote double {mustBeReal} 
        EstimatedRange double {mustBeReal} 
        EstimatedExposure double {mustBeReal} 
        EstimatedRate double {mustBeReal} 
    end

    % Constant 
    properties (Constant)
        Name = 'Power Law Fitter'
    end

    %% Methods %%
methods

    %%% Constructor %%%
    function obj = PowerLawFitter(ObservedRT)
        if nargin > 0
            obj.ObservedRT = ObservedRT;
            obj.updateCount;
        end
    end

    %%% Display %%%
    function disp(obj)
        if size(obj.Count, 1) == 0
            fprintf("PowerLawFitter object that hasn't been provided input yet! No parameter estimates to report. \n Please pass a 1xn vector to begin estimation. \n");
        elseif size(obj.EstimatedAsymptote, 1) == 0 && size(obj.Count, 1) == 1
            fprintf('Number of trials = %i\n', obj.Count);
            fprintf('Mean RT = %.2f\n', mean(obj.ObservedRT));
            fprintf('Standard deviation = %.2f\n', std(obj.ObservedRT));
            fprintf('Range = %.2f\n', max(obj.ObservedRT)-min(obj.ObservedRT));
            fprintf('Fit() has not yet been run. No other parameter estimates to report.\n')
        else
            fprintf('Number of trials = %i\n', obj.Count);
            fprintf('Mean RT = %.2f\n', mean(obj.ObservedRT));
            fprintf('Standard deviation = %.2f\n', std(obj.ObservedRT));
            fprintf('Range = %.2f\n', max(obj.ObservedRT)-min(obj.ObservedRT));
            fprintf('Estimated asymptote (A) = %.2f\n', obj.EstimatedAsymptote);
            fprintf('Estimated range (B) = %.2f\n', obj.EstimatedRange);
            fprintf('Estimated exposure (E) = %.2f\n', obj.EstimatedExposure);
            fprintf('Estimated beta = %.2f\n', obj.EstimatedRate);
        end
     end

    %%% Setter %%%
    function set.ObservedRT(obj, v)
        obj.ObservedRT = v;
        obj.updateCount;
    end


    %%% Computation functions %%%

    % Expected reaction time
    ERT = Expectation(obj, parameters)

    % Sum of squared errors
    SSE = SumOfSquaredError(obj, parameters)

    % Fitter
    Fit(obj)

end

methods (Access = private)
    function updateCount(obj)
        obj.Count = size(obj.ObservedRT, 2);
    end

end

end