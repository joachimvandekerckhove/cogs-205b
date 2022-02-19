% getData. 
% This function downloads the file in the first argument and saves it with
% the name in the second argument
function [] = getData(url,name)
    %https://cidlab.com/files/cogs205b.csv
    fullURL =url;% ["https://cidlab.com/files/cogs205b.csv"];
    filename = name;%'cogs205b.csv';
    urlwrite(fullURL,filename); %#ok<URLWR> 
end