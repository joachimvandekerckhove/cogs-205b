function obj = DetermineBurnIn(obj,numSamples)
% obj = DetermineBurnIn(obj,numSamples)
% Sets the burn-in length to a smaller number if n is too small
% The default value is 200, so this shouldn't happen much.
% Also probably unnecessary for 205B, since line 101 of
% metropolis_application seems to do its own burn in. Oh well.

    if obj.BurnIn > numSamples/100
        obj.BurnIn = round(numSamples/100); % Throw away 1% of data
    end
    
end