function path_file = getData(url)
% This function takes a URL to a data file and downloads it, 
% the output is the local path to the file.
    % Check if URL is valid
    [str,status] = urlread(url);
    if status == 0
        error('URL is not valid.');
    end

    % Read formated data using url
    datos = webread(url);
    % Write table in csv file in current directory
    writetable(datos,'dataFile.csv');
    % get path to the new data file
    path_file = append(fileparts(which('dataFile.csv')),'/dataFile.csv');
end