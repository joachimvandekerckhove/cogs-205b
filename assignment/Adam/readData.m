function [X] = readData(fileName)
% Output the variable

%Expects: Input is the name of a local file filename with numbers (like
%http://cidlab.com/files/cogs205b.csv).
%Promises: Output is a MATLAB variable containing the content of filename.

Data = readtable(fileName);

X=Data{:,:}';

end