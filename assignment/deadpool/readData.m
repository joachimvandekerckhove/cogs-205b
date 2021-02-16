function data = readData(path)
% This function reads a data file saved on a csv file where the names 
% of the variables are stored on the first row
    if ~exist(path,'file')
        error('Directory: %s \n does not exist', path)
    end

    readtable(path)
end