function filename = getData(url)
% -------------------------------------------------------------------------
% filename = getData('url') takes a url for a data file (CHAR input), 
% downloads the file to the current folder via urlwrite, and outputs the 
% name of the local file. The file name is the part of the url that is 
% after the last "/" in the url.
% -------------------------------------------------------------------------

str = split(url,'/');

filename = str{end};

% urlwrite(url,filename);
websave(filename,url);

end
