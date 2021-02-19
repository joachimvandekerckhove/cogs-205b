function data = getData(url)
% data = getData(url)
% Downloads data from a given url
% Exports using the filename in the url
% url must be a string (obviously)

    filesplit = strsplit(url,'/');
    filename = filesplit{end};
    outfilename = websave(filename,url);
    data = readData(outfilename)';
    % Reflect it b/c it's 10*2 on the web but .estimate wants 2*n
end
