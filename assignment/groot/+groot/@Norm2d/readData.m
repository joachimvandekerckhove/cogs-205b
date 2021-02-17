function outMat = readData(obj, infile)
%READDATA Read data in file into variables
% Input : infile - file containing the input
%                  assumes each col corresponds to 1d data
% Output: outMat - 2xN matrix of file data 

    [outvar1, outvar2] = readvars(infile);
    outMat = [outvar1'; outvar2'];
end

