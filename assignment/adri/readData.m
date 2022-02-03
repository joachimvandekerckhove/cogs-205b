%  Reading data from a csv file with header = True. Data must be Nx2
function data = readData(path)
    % Get file name
    [filepath,name,ext] = fileparts(path);
    filename = append(name,ext);
    % Could the file been found?
    if ~exist(path,'file')
        error(append('File ', filename, ' could not be found'), path);
    end
    contenido = readtable(path,'HeaderLines', 1);
    % Check if file contains a Nx2 dataframe.
    if ~(width(contenido)==2)
        error('The file does not contain 2 columns')
    end
    % Transform into a matrix and save
    dat = contenido{:,:};    
end