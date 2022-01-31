function output = test()

% test() runs a test suite of the functions in the package:
% getData.m
% readData.m
% main.m
% report.m
% this test suite is heavily borrowed from testSuiteForNorm2d.m
% lol idk what to put in this package ahh

%% Let's begin!

% ask user for pseudonym
pseudonym = input('Enter your pseudonym here: ','s');


%% Report 
% Start printing a lil report to the screen

% make a long line
dashline = repmat('-',1,83);

% print a long line
fprintf('#%s#\n', dashline);

% print time and date
fprintf('# %80s  #\n', datestr(now));

% print report title
fprintf('#%-83s#\n', sprintf(' Test suite for +%s package',pseudonym));

% print another long line
fprintf('#%s#\n', dashline);

%% tests for getData.m

% throw error if url is a bad url?
try
    urlBad = 'www.potatoescomeinallshapesandsizes.com';
    angela.getData(urlBad)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'getData. good URL.')

% output is a string
if ischar(angela.getData('http://cidlab.com/files/cogs205b.csv'));
    errorThrown = true;
else
    errorThrown = false;
end
assertErrorThrown(errorThrown, 'getData. output is a char.')


%% tests for readData.m

% throw error if nonexistent file?
try
    ghostFile = 'potato.csv';
    angela.readData(ghostFile)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'readData. file exists.')

% check output
if isa(angela.readData('cogs205b.csv'),'double')
    errorThrown = true;
else
    errorThrown = false;
end
assertErrorThrown(errorThrown, 'readData. output is a double.')


%% tests for report.m

% wrong size data
try
    wrongSizeData = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,15];
    angela.report(wrongSizeData)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'report. correct size data.')

% check for output
% ?????????


%% tests for main.m

% check if there is a .md output


%% it's a wrap!

% print a long line
fprintf('#%s#\n', dashline);

% print a message
fprintf('#%-83s#\n', sprintf('  tests are done!'));

% print a long line
fprintf('#%s#\n', dashline);

%% subfunctions

    % assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('Test failed: %s\n',condition)
            disp('I expected an error to be thrown')
            throwAsCaller(failure(condition))
        end
    end

    % success message
    function success(condition)
        fprintf('# %-73s ', sprintf(' %s', condition));
        fprintf('passed  #\n');
    end

    % failure message
    function me = failure(condition)
        fprintf('# %-73s failed  #\n', sprintf(' %s', condition));
        fprintf('#%s#\n', dashline);
        me = ...
            MException('infinitesadness:testSuite', ...
            sprintf('test suite failed for condition "%s"',condition));
    end


end