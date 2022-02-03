function file = getData(url)

    % GETDATA    Downloads a data file from a url
    
    % function
    fileparts = split(url, "/");
    filename = string(fileparts(end));
    filename = strcat("+lemontgomery2/", filename);
    file = websave(filename, url);
        
    % check for errors
    [str, status] = urlread(url);
    
    if (isempty(url) == 1)
        disp 'url has zero characters'
    end
    return;
    
    if (status == 0)
        disp 'url is not loading'
    end
    return;

end