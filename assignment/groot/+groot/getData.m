function outfile_name = getData(obj, url)
%GETDATA Downloads data from url
% Input : url address
% Output: absolute path where the data is downloaded
% Downloaded file will be named downloaded_data
    
    outfile_name = websave('downloaded_data', url);
end

