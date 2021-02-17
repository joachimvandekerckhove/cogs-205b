function [outvar1, outvar2] = readData(obj, infile)
%READDATA Read data in file into variables
% Input : infile - file containing the input
%                  assumes each col corresponds to 1d data
% Output: [outvar1, outvar2] - two columns of file data

    [outvar1, outvar2] = readvars(infile);
end

