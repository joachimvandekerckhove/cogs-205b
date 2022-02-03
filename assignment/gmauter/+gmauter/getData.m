function output = getData(url)

% saves data from http://cidlab.com/files/cogs205b.csv

url_str = strsplit(url, '/'); % splits url into cell array
file_name = url_str{end}; % gets last vector in array (csv file)
output = websave(file_name, url) % saves data from url

end