function DecideAccept(obj)
%DecideAccept - accept-reject algorith

    % Calculate the logarithm of u ~ uniform(0,1) to compare acceptance ratio.
    u = log( rand(1) )

    % Compare log acceptance ratio to 0 or with u if > 0 or > u accept, reject otherwise
    if ge(obj.LogAccept , 0) || u < obj.LogAccept;
        obj.Accept = true;
    else
        obj.Accept = false;
    end
end