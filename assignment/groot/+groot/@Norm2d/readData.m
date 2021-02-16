function outvar = readData(obj, infile)
%READDATA Read data in file into variables
% Input : infile - file containing the input
%                  assumes each col corresponds to 1d data
%       : num_cols - number of cols expected
% Output: outvar - data in file in a column 

    [outvar1, outvar2] = readvars(infile);
    outvar = [outvar1, outvar2];
end

