function main()
%  MAIN  requires functions getData.m readData.m and report.m 
%
% This function uses the function getData.m to obtain data from a specific URL
% Then reads the data using the function readData.m and eliminates the variable names
% The data are then transposed and used as input for the function report.m which uses
% the class Norm2d to generate a report containing the mean and covariance matrix of the 
% variables in data.

% Download data and get the pah in the directory where it was stored
path_to_data = getData('http://cidlab.com/files/cogs205b.csv');

% Read data from the path saved with get data 
data_matrix = readData(path_to_data);

% Transpose data to be used by report function
data_matrix = data_matrix.';

% Generate report
report(data_matrix);
end