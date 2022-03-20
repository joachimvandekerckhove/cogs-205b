function output = getData(url)

% Expects: URL to data file. Promises: Downloads file to the computer.

url_str = strsplit(url, '/'); % splits url into cell array
file_name = url_str{end}; % gets last vector in array (csv file)
output = websave(file_name, url); % saves data from url

end