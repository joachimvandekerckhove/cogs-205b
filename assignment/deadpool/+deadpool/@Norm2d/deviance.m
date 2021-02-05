function dev = deviance(obj,data)
    % Compute the deviance of data for a given Mean and CovM
% Validate properties of the point xax
% Is xax a matrix of dimentions 2,n?        
    if ~(size(data,2)==2 | size(data,1)==2)
        error('Data has to be 2 dimentional.')
    end

% Check numerical properties of data
    if ~(isnumeric(data) & isfinite(data) & isreal(data))
        error('Data must contain real finite values')
    end

% Transpose data matrix if participants are in column format
    if (size(data,1)==2)
        data = data.';
    end

% Vector of zise npoints of 0's
    dev = - 2 * sum( obj.logpdf(data) );
end