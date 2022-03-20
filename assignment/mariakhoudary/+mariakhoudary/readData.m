function data = readData(filename)

% READDATA takes as input a local filename (must be a string) and outputs a
% variable containing the content of filename. 

data = readtable(filename);