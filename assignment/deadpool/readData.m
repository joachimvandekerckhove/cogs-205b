function data = readData(path)
% This function reads a data file saved on a csv file where the names 
% of the variables are stored on the first row
    if ~exist(path,'file')
        error('Directory: %s \n does not exist', path);
    end

    tmp = fopen(path); % open the file to object tmp
    names = fgetl(tmp);       % read the first line
    fclose(tmp);

    if ~(isnumeric(names))
        % Read data file in path with first row as names
        tmp_dat = readtable(path,'HeaderLines', 1);

        % Transform table to a matrix and save it as data
        data = tmp_dat{:,:};
        fprintf('Variable names have been removed, object stored in matrix format. \n')
    else 
        tmp_dat = readtable(path);
        data = tmp_dat{:,:};
    end
end