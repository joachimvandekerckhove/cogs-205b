function dev = deviance(obj,data)
% Compute the deviance of data for a given Mean and CovM
    % Validate properties of the point xax
    Check_data(data);

    % Vector of zise npoints of 0's
    dev = - 2 * sum( obj.logpdf(data) );
end