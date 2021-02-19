function [fileName]=getData(url)
% Ouput the data file in the directory

%Expects: Input is a URL to a data file.
%Promises: Downloads the file to the computer. Output is the name of the
%local file.

Data=webread(url);

fileName='cogs205b.csv'
urlwrite(url,fileName);


end