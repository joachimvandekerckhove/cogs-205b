function Check_data(datos)
% Check properties of a data matrix

    % Are datos a matrix of dimentions 2 x N
    if ~(size(datos,1)==2)
        error('Data has to be a matrix of size 2 x N.');
    end

    % Are datos numerical values
    if ~(isnumeric(datos))
        error('Data must contain only numeric values.');
    end

    % Are datos real numbers
    if ~(isreal(datos))
        error('Data must contain only real numbers.')
    end

    % Are datos finite
    if ~(all(isfinite(datos)))
        error('Data must contain only finite values.')
    end
end