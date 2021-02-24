% Test Suite Assignment 3: 
% Runs tests to ensure report generation for Norm2d object from raw data (provided as URL)
% Checks getData.m, readData.m, report.m, main.m & Norm2d generated object
function test()
%% Report
% Print beginning of report
fprintf("#%s#\n", repmat('-',1,77))
fprintf ('# %74s  #\n', datestr(now))
fprintf('#%-77s#\n', sprintf('Assignment 3 test suite for phoenix'))
fprintf("#%s#\n", repmat('-',1,77))

throwAsCaller = @(x)warning(x.message);

% check for valid URL
try
	randomURL = "http://cidlab.com/files/cogs205b.csv";
	getData(randomURL);
	errorThrown = true;
catch
	errorThrown = false;
end
assertErrorThrown(errorThrown,"Valid URL")

% check for valid file
try
        randomfile = "data_cidlab.csv";
        readData(randomfile);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown,"Valid local file")


%% Negative Tests
% Valid Data: NaNs
try
	d = [1 2 0.4 4 7; 4 6 6 4 3];
	phoenix.Norm2d.estimate(d);
	errorThrown = true;
catch
	errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: no NaNs")

% Valid Data: Complex
try
        d = [1 2 4 8 2; 6 2 3 6 9];
        phoenix.Norm2d.estimate(d);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: real numbers only")

% Valid Data: Finite
try
        d = [1 2 5 7 4; 2 4 6 2 3];
        phoenix.Norm2d.estimate(d);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: finite numbers only")

% Valid Data: Numeric
try
        d = [1 2 4 6 4; 0 6 8 2 3];
        phoenix.Norm2d.estimate(d);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: numeric input only")

% Valid Data: Correct dimensions
try
        d = [1 2 6 8 4; 0 6 8 4 9];
        phoenix.Norm2d.estimate(d);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: correct dimensions");

% Valid Data: Transpose OK
try
        d = [1 2 4 2 5; 9 7 3 5 2]';
        phoenix.Norm2d.estimate(d);
        errorThrown = true;
catch
        errorThrown = false;
end
assertErrorThrown(errorThrown, "Data: transpose OK")



% Assert that an error was thrown on a call (below slightly modified from J.V. testSuiteAssignment2.m)
    function assertErrorThrown(a,condition)
	if a
            success(condition)
        else
            fprintf('#%s#\n');
            fprintf('!  Test failed: %s\n', condition)
            throwAsCaller(failure(condition));
        end
    end

    % Success message
    function success(condition)
        fprintf('# %-67s ', sprintf(' %s', condition));
        fprintf('passed  #\n');
    end

    % Failure message
    function me = failure(condition)
        fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
        fprintf('#%s#\n');
        me = ...
            MException( ....
                'phoenix:testSuite', ...
                sprintf('TESTSUITE failed for condition "%s"', condition));
    end
fprintf("#%s#\n", repmat('-',1,77))
end

