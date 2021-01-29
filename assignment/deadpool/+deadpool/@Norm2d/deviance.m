function dev = deviance(obj,data)
    % Compute the deviance of data for a given Mean and CovM
% Validate properties of the point xax
% Is xax a matrix of dimentions 2,n?        
    if ~(size(data,2)==2)
        error('Data has to be 2 dimentional.')
    end

% Are the values on xax finite?
    if ~(isfinite(data))
        error('Data must be a finite value.')
    end

% Are the values on xax real numbers?
    if ~(isreal(data))
        error('data must be a real matrix.')
    end

% Transpose data to use methods in the class
    datat = transpose(data);

% Number of 2d points to evaluate
    npoints = size(data,2);

% Get the determinant of the Covariance matrix
    detertminant = det(obj.CovM);

% Get natural log of inverse square root of the determinant of Covariance matrix
    loginvsqrtdet = -0.5 * log(detertminant);

    devi = zeros(npoints,1);

    for i = 1:npoints
        logkrnl(i) = -0.5*((datat(:,i) - obj.Mean).' * obj.PrecisionM * (datat(:,i) - obj.Mean));
        devi(i) = log(obj.scalingconstant)+invsqrtdet+logkrnl(i)
    end

    dev = - 2 * sum(devi)
end