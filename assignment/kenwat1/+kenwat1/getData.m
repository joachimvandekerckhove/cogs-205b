function filename = getData(url)
% Downloads the file from URL to the computer and then output the name

[~,name,ext] = fileparts(url);
filename = [name ext];
urlwrite(url,filename);

end

