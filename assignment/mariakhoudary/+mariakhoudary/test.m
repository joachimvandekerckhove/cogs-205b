function test()

% TEST runs a basic test suite of the +mariakhoudary package

%% Test estimate() function
correctDims = [1:4; 5:8];
incorrectDims = [1:3; 4:6; 7:9];

% make sure it returns error for incorrect input dimensions
try
    mariakhoudary.Norm2d.estimate(incorrectDims)
catch
    disp('Test passed: Norm2d.estimate returns error for incorrect input dimensions')
end

% make sure it returns a Norm2d object
obj = mariakhoudary.Norm2d.estimate(correctDims);
if string(class(obj)) ~= 'mariakhoudary.Norm2d'
    disp('Test failed: Norm2d.estimate does not return Norm2d object')
else
    disp('Test passed: Norm2d.estimate returns Norm2d object')
end

% make sure it updates mean & covariance based on input
correctMean1 = mean(correctDims(1,:));
correctMean2 = mean(correctDims(2,:));
correctMean = vertcat(correctMean1, correctMean2);
correctCovariance = cov(correctDims(1,:), correctDims(2,:));

if obj.Mean ~= correctMean
    disp('Test failed: Norm2d.estimate did not update mean based on input')
elseif obj.Covariance ~= correctCovariance
    disp('Test failed: Norm2d.estimate did not update covariance based on input')
else
    disp('Test passed: Norm2d.estimate accurately updates mean & covariance based on input')
end

%% Test getData
% make sure it takes only URL as input
badURL = 'cidlab/files/cogs205b.csv';
goodURL = 'http://cidlab.com/files/cogs205b.csv';

try 
    mariakhoudary.getData(badURL)
catch
    disp('Test passed: getData returns error if not passed a URL')
end

% make sure it downloads the file & returns the path
file = mariakhoudary.getData(goodURL);
if ~contains(file, {'/', 'mariakhoudary', 'csv'})
    disp('Test failed: getData does not return path to downloaded file')
else
    disp('Test passed: getData returns path to downloaded file')
end

%% Test readData

% make sure it only takes a string as an input
try
    mariakhoudary.readData(cogs205b.csv)
catch
    disp('Test passed: readData only takes string input')
end

% make sure it takes numeric string & creates a MATLAB variable
data = mariakhoudary.readData('cogs205b.csv');
if exist('data') == 1
    disp('Test passed: readData takes numeric string & creates a MATLAB variable')
else
    disp('Test failed: readData did not create a MATLAB variable based on numeric string input')
end

%% Test report

% make sure it only takes a MATLAB variable as input
try
    mariakhoudary.report('cogs205b.csv')
catch
    disp('Test passed: report does not take .csv as input')
end

% make sure that report generates a markdown file
data = mariakhoudary.checkData(data);
mariakhoudary.report(data)
if size(dir('mariakhoudary-1.md'), 1) == 0
    disp('Test failed: report did not generate "mariakhoudary-1.md"')
elseif size(dir('mariakhoudary-1.md'), 1) == 1
    disp('Test passed: report generated "mariakhoudary-1.md"')
end

% make sure markdown file contains mean and covariance 
filetext = fileread('mariakhoudary-1.md');
% scan file for Mean
if size(regexp(filetext, 'Mean', 'match'), 1) == 1
    disp('Test passed: report includes Mean')
elseif size(regexp(filetext, 'Mean', 'match'), 1) == 0
    disp('Test failed: report does not include Mean')
end
% scan file for Covariance
if size(regexp(filetext, 'Covariance', 'match'), 1) == 1
    disp('Test passed: report includes Covariance')
elseif size(regexp(filetext, 'Covariance', 'match'), 1) == 0
    disp('Test failed: report does not include Covariance')
end













