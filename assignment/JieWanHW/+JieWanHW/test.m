% It is a basic test suite of the functions in this JieWanHW package.

function test(pseudonym)

	% Did the user give input?
	if ~nargin
	    pseudonym = input('Enter your pseudonym here: ', 's');
	end

	% Is the input valid?
	if exist(pseudonym,'dir')
	    addpath(pseudonym)
	else
	    error('testSuite:pseudonymDirNotFound', ...
	        '%s/ not found.  Are you in the assignment/ directory?', ...
	        pseudonym)
	end

	% Is there a class file in there?
	try
	    this = [];
	    eval(sprintf('this = %s.Norm2d();', pseudonym))
	catch me
	    fprintf('I couldn''t find a class named %s.Norm2d.\n', pseudonym);
	    throw(me)
	end

	throwAsCaller = @(x)warning(x.message);

	%% Report
	% Start printing a little report to screen

	% make a long line
	dashline = repmat('-', 1, 77);

	% print a line
	fprintf('#%s#\n', dashline);

	% print time and date
	fprintf('# %74s  #\n', datestr(now))

	% print report title
	fprintf('#%-77s#\n', sprintf('  Test suite for "%s"  ', pseudonym))

	% print a line
	fprintf('#%s#\n', dashline);


	try
		file = getData('http://cidlab.co/files/cogs205b.csv');
		errorThrown = false;
	catch
		errorThrown = true;
	end

	assertErrorThrown(errorThrown, 'check function getData - wrong link')

	try
		data = readData('cogs.csv');
		errorThrown = false;
	catch
		errorThrown = true;
	end

	assertErrorThrown(errorThrown, 'check function readData - not exsited file')

	try
	    testdat = [1 2 3; 4 5 6; 7 8 9];
		report(testdat);
		errorThrown = false;
	catch
		errorThrown = true;
	end

	assertErrorThrown(errorThrown, 'check function report - data is not 2 dimension')


	%% Wrap up
	fprintf('#%s#\n', dashline);
	fprintf('# %74s  #\n', datestr(now))
	fprintf('#%-77s#\n', sprintf('  All tests passed for "%s"  ', class(this)))
	fprintf('#%s#\n', dashline);

	%% Subfunctions
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
                'magneto:testSuite', ...
                sprintf('TESTSUITE failed for condition "%s"', condition));
    end

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





end