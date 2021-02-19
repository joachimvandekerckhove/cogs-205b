% fprintReport - fprintReport(fhandle, input)
% fhandle is the handle output of fopen
% input is a Norm2d class object
%
% This function writes directly to the file specified,
% and does not generate an output variable.

% getData - data = getData(url)
% Downloads data from a given url
% Exports using the filename in the url
% url must be a string (obviously)

% main - main
% Main script for estimating bivariate distribution from online data
% Calls every other function in this package
% Without any input, will generate a bivariate distribution based on sample
% data found at a stored URL

% readData - output = readData(input)
% Takes an input file and reads the data into a variable
% input is a string of the filename
% Mimics the built-in function readmatrix()
% If anything, it should probably be a private function...

% report - report(myNorm2d)
% This just handles the IO for generating a report; fprintReport does the heavy lifting.
% Takes a Norm2d class object as input
% Ultimately generates a markdown file cable-1.md listing the mean and
% covariance matrix of myNorm2d.

% test - test
% Test suite that validates each function in this package.
% Suppresses errors, but tells you which functions are to blame.
