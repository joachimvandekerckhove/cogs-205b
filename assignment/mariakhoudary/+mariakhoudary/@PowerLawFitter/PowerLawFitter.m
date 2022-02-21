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
        Count double {mustBeReal, mustBePositive, mustBeFinite, mustBeNonzero, mustBeInteger} = ...
            size(ObservedRT, 2)
        EstimatedAsymptote double {mustBeReal} = 1
        EstimatedRange double {mustBeReal} = 0.5
        EstimatedExposure double {mustBeReal} = 0.75
        EstimatedRate double {mustBeReal} = 1
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
            updateCount;
        end
    end

    %%% Display %%%
    function disp(obj)
        %%% displays Count & parameter estimates
    end

    %%% Setter %%%
    function set.ObservedRT(obj, v)
        obj.ObservedRT = v;
        obj.updateCount;
    end


    %%% Computation functions %%%

    % Expected reaction time
    ERT = Expectation(obj, A, B, E, beta)

    % Sum of squared errors
    SSE = SumOfSquaredError(obj, A, B, E, beta)

    % Fitter
    Fit(obj)

end

methods (Access = private)
    function updateCount(obj)
        obj.Count = size(obj.ObservedRT, 2);
    end

end

end