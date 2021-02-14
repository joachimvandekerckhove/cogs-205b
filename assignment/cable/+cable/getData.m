function data = getData(url)
    % download data from a URL
    filesplit = strsplit(url,'/');
    filename = filesplit{end};
    outfilename = websave(filename,url);
    data = readData(outfilename)';
    % Reflect it b/c it's 10*2 on the web but .estimate wants 2*n
end
