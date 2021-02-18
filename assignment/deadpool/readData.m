function data = readData(path)
%  READDATA  Reads data from a csv file with one header row.
%
% This function reads a data file saved on a csv format where the names 
% of the variables are stored in the first row. The maximum number of 
% columns allowed is 2, because the file is to be used with the class Norm2d.

    % Check if the given path exists.
    if ~exist(path,'file')
        error('Directory: %s \n does not exist', path);
    end

    % Read data file in path with first row as names
    tmp_dat = readtable(path,'HeaderLines', 1);

    % Check if data has more than 2 columns.
    if ~(width(tmp_dat)==2)
        error('Data must contain 2 variables in columns.')
    end

    % Transform table to a matrix and save it as data
    data = tmp_dat{:,:};
    fprintf('Variable names have been removed, object stored in matrix format. \n')
end