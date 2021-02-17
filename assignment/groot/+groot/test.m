function test()
%TEST Basic test suite of functions in package 

%% Report
%--From testSuiteAssignment2.m
% Start printing a little report to screen

% make a long line
dashline = repmat('-', 1, 77);

% print a line
fprintf('#%s#\n', dashline);

% print time and date
fprintf('# %74s  #\n', datestr(now))

% print report title
fprintf('#%-77s#\n', '  Test suite for "groot.Norm2d"  ')

% print a line
fprintf('#%s#\n', dashline);


%% Test for getData
url = 'http://cidlab.com/files/cogs205b.csv';
gibberish = 'httwe://ewqt.hrweadfgh';

% Test output is string
truth_filename = groot.getData(url);
assert( (ischar(truth_filename)||isstring(truth_filename)), 'getData(): Output should be string');

% Test input type
try
    out = groot.getData(gibberish);
    errorFormatting('getData', 'Enforce downloadable url');
catch
    successFormatting('getData input downloadable checked');
end


%% Test for readData
% Test output content
truth = readmatrix(truth_filename)';
out = groot.readData(truth_filename);
assert(isequal(truth,out),'readData output incorrect');

% Negative test random input 
try
    out = groot.readData(gibberish);
    errorFormatting('readData', 'Input readability check');
catch
    successFormatting('readData input checked');
end

%% Test for estimate 
% Output is instance of Norm2d object 
out = groot.estimate(truth);
assert(isequal(class(out), 'groot.Norm2d'), 'estimate(): Output should be instance of class Norm2d');

% Reasonable mean
assert( all(abs(out.Mean-1) < 0.5), 'estimate(): Wrong mean estimate' );

% Input dimension enforce
try
    out = groot.estimate(ones(3,10));
    errorFormatting('estimate', 'Enforce input dimension size');
catch
    successFormatting('estimate input dimension checked');
end


%% Test for report
% Create markdown output
groot.report(truth);
[filepath, name, ext] = fileparts(getlatestfile(pwd));
assert(strcmp(ext,'.md'), 'report(): Output should be .md file');

% Negative test illegal input
try
    groot.report(ones(3,10));
    errorFormatting('report', 'Input dimension should be 2xN');
catch
    successFormatting('report input checked');
end

%% Wrap up

fprintf('#%s#\n', dashline);
fprintf('# %74s  #\n', datestr(now))
fprintf('#%-77s#\n', 'Test complete')
fprintf('#%s#\n', dashline);


%% subfunction
    function errorFormatting(functionName, errorString)
        dashline = repmat('-', 1, 77);
        fprintf('#%s#\n!  Test failed: groot.%s\n%s\n%s',...
            dashline, functionName, errorString, dashline);
    end

    function successFormatting(conditionName)
        dashline = repmat('-', 1, 77);
        fprintf('#%s#\n!  Test passed: groot.%s\n%s\n',...
            dashline, conditionName, dashline);
    end

    %https://www.mathworks.com/matlabcentral/answers/203432-can-matlab-read-the-most-recent-made-file-in-the-default-folder
    function latestfile = getlatestfile(directory)
    %This function returns the latest file from the directory passsed as input
    %argument

    %Get the directory contents
    dirc = dir(directory);

    %Filter out all the folders.
    dirc = dirc(find(~cellfun(@isdir,{dirc(:).name})));

    %I contains the index to the biggest number which is the latest file
    [A,I] = max([dirc(:).datenum]);

    if ~isempty(I)
        latestfile = dirc(I).name;
    end

    end
end
