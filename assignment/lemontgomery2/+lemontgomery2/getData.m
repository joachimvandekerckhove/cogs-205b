function file = getData(url)

    % GETDATA    Downloads a data file from a url
    
    % function
    fileparts = split(url, "/");
    filename = string(fileparts(end));
    filename = strcat("+lemontgomery2/", filename);
    file = websave(filename, url);
    
end