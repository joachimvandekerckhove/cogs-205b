%  Download a datafile from a given URL
function datFile = getData(url)
    %Is the URL providedd valid?
    [str,status] = urlread(url);
    if status == 0
         error('MATLAB:requireValidURL','The URL provided is not valid.');
    end
    %If so, read content
    dat = webread(url);    
    %Get the name of the file
    [filepath,name,ext] = fileparts(url);
    filename = append(name,ext);
    %Write a table
    writetable(dat,filename);
    %Return as output the path to the downloaded file
    datFile = append(fileparts(which(filename)),append("/",filename));
end
