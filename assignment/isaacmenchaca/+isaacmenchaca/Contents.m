% +ISAACMENCHACA
%
% Files
%   getData  - Expects: Input is a URL to a data file. Promises: Downloads the file to the computer. Output is the name of the local file.
%   main     - Expects: No input. Promises: Generates a report file named isaacmenchaca-1.md that contains the mean and covariance of the bivariate data that are contained in http://cidlab.com/files/cogs205b.csv.
%   readData - Expects: Input is the name of a local file filename with numbers expecting two columns for variables (e.g. X and Y). Promises: Output is a MATLAB variable containing the content of filename.
%   report   - Expects: A MATLAB variable containing bivariate (X, Y) data. Promises: Produces a .md file that presents the mean and covariance of the data.
%   test     - Expects: No input. Promise: Runs a test suite that verifies the functionality of the functions in the package.
%   cell2md  - Expects: cell array to write. Promises: Save a cell array as a markdown table
