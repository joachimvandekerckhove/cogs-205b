function output = getData(url)
% Expects: Input is a URL to a data file. Promises: Downloads the file to the computer. Output is the name of the local file.

    try
    urlSplit = strsplit(url , '/');
    fileName = urlSplit(length(urlSplit));
    urlwrite(url,fileName);
    output = pwd + "/" + fileName;
    catch 
        ME = MException('URL:NotValidURLforDataRetrieval', ...
            'The URL does not exist/ appropriate for data retrieval.');
         throw(ME)
    end 
    

    
end

