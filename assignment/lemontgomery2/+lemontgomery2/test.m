function test()

    % TEST    Tests each function and method in the package
    % Heavily borrowed from testSuiteForNorm2d.m
    
%% Start with some sanity checks

% Did the user give input?
if ~nargin
    pseudonym = input('Enter your pseudonym here: ', 's');
end

%% Report
% Start printing a little report to screen

% make a long line
dashline = repmat('-', 1, 77);

% print a line
fprintf('#%s#\n', dashline);

% print time and date
fprintf('# %74s  #\n', datestr(now))

% print report title
fprintf('#%-77s#\n', sprintf('  Test suite for "%s.Norm2d.element"  ', pseudonym))

% print a line
fprintf('#%s#\n', dashline);


if exist('getData') %#ok<EXIST>

%% Tests of the getData function
    
try
    getData('');
    errorThrown = true;
catch
    errorThrown = false;
end

assertErrorThrown(errorThrown, 'getData . url cannot have zero characters')

try
    getData('invalidurl');
    errorThrown = true;
catch
    errorThrown = false;
end

assertErrorThrown(errorThrown, 'getData . url must load (be a valid url)')

end

if exist('readData') %#ok<EXIST>

%% Tests of the readData function
    
try
    readData('potato.csv');
    errorThrown = true;
catch
    errorThrown = false;
end

assertErrorThrown(errorThrown, 'readData . unable to find or open "potato.csv"')

try
    readData([1 2 3; 4 5 6; 7 8 9]);
    errorThrown = true;
catch
    errorThrown = false;
end

assertErrorThrown(errorThrown, 'readData . data is of incorrect dimensions, it should be Nx2')

end

if exist('report') %#ok<EXIST>

    %% Tests of the report function

    [X, Y] = readvars(lemontgomery2.getData('http://cidlab.com/files/cogs205b.csv'));
    actualData = [X, Y];
    
    assertEqualUpToTol(lemontgomery2.Norm2d.estimate(actualData).Mean, ...
                       mean(actualData)', ...
                       'report . the mean is correct')

    assertEqualUpToTol(lemontgomery2.Norm2d.estimate(actualData).Covariance, ...
                       cov(actualData), ...
                       'report . the covariance is correct')
                   
    try
        report(actualData);
        isfile('+lemontgomery2/lemontgomery2-1.md') == 1;
        errorThrown = false;
    catch
        errorThrown = true;
    end
    
    assertErrorThrown(errorThrown, 'report . report md file exists')


end

if exist('main') %#ok<EXIST>

    %% Tests of the main function - in other subfunctions

end

%% Subfunctions

    % Assert an approximate equality
    function assertEqualUpToTol(a, b, condition)
        if all(abs(a-b) < 1e-10)
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected a==b:')
            disp('a:'), disp(a)
            disp('b:'), disp(b)
            throwAsCaller(failure(condition))
        end
    end

    % Assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected an error to be thrown')
            throwAsCaller(failure(condition))
        end
    end

    % Success message
    function success(condition)
        fprintf('# %-67s ', sprintf(' %s', condition));
        lookBusy(2)
        fprintf('passed  #\n');
    end

    % Failure message
    function me = failure(condition)
        fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
        fprintf('#%s#\n', dashline);
        me = ...
            MException( ....
                'magneto:test', ...
                sprintf('TEST failed for condition "%s"', condition));
    end

    % Skip message
    % function skipCheck(condition)
    %    fprintf('# %-63s ', sprintf(' %s', condition));
    %    lookBusy(2)
    %    fprintf('not tested  #\n');
    % end

    % If reports generate too fast, people don't believe they did anything
    function lookBusy(k)
        for r = 1:k
            for s = '\|/-'
                fprintf('%s', s);
                pause(.005)
                fprintf('\b');
            end
        end
    end
    
%% Wrap up

fprintf('#%s#\n', dashline);
fprintf('# %74s  #\n', datestr(now))
fprintf('#%-77s#\n', sprintf('  All tests passed'))
fprintf('#%s#\n', dashline);


end