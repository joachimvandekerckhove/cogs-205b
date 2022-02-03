function test()

% Expects: Nothing. Promises: Test suite of package functions.

% command window displays test results

url = 'http://cidlab.com/files/cogs205b.csv'

try
    file_name = gmauter.getData(url)
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'getData . failed to get data from URL: check URL')

try
    X = gmauter.readData(file_name)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'readData . failed to read content from URL')




try
    gmauter.Norm2d().estimate(X)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'estimate . failed to estimate mean and covariance matrix')



try
    gmauter.report(X)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'report . report failed')


    % Assert that an error was thrown on a call
    function assertErrorThrown(a,condition) % from testSuiteForNorm2d.m
        if a
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected an error to be thrown')
            throwAsCaller(failure(condition))
        end
    end
end