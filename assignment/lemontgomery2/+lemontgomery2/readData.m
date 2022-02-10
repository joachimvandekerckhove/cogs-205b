function data = readData(file)

    % READDATA    Reads the data file into a variable
    
    % function
    [X, Y] = readvars(file);
    data = [X, Y];
    
    % check for errors
    if (size(data, 2) ~= 2)
        error('readData:InputIncorrectDimensions', ...
              'data is of incorrect dimensions, it should be Nx2')
    end
    return;
    
end