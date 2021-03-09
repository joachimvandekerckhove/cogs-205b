function out = otherFunction(v, a, t, w)
% The ugly part of the math that sums to infinity.
% BUT, since the exponent portion approaches zero, there's a shortcut!
% Once the difference between consecutive elements is sufficiently small,
% you can ignore subsequent elements since they stop contributing.
    
    threshold = 0.001;
    k = 1;
    summand = [];
    while 1
        myExp(k,:) = exp(-(k^2 .* pi^2 .* t)/(2*a^2));
        summand(k,:) = k .* myExp(k,:) .* sin(k*pi*w);
        if k > 1
            if sum(summand,1) - sum(summand(1:k-1,:),1) < threshold
                break;
            end
        end % if
        k = k + 1;
    end % while
    out = pi/(a^2) .* exp(-v*a*w - (v^2.*t)/2) .* sum(summand);
end % function