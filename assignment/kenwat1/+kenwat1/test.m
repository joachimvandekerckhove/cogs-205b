function test
% Runs a basic test suite of the functions in the package

% testing getData.m
try  
    filename = kenwat1.getData(); % no input
    errorThrown = 0;
catch
    errorThrown = 1;
end

assertErrorThrown(errorThrown, 'getData. no input')

try 
    filename = kenwat1.getData('http://www.cidlabcom/files/cogs205b.csv'); % missing a dot
    errorThrown = 0;
catch
    errorThrown = 1;
end

assertErrorThrown(errorThrown, 'getData. non-exisitng URL')

% testing readData.m 
try 
    cogs205b = 205; % non-string filename
    data = kenwat1.readData(cogs205b) 
    errorThrown = 0;
catch
    errorThrown = 1;
end

assertErrorThrown(errorThrown, 'readData. non-string filename')

% testing report.m 
try 
    X = [1 3 7; 4 5 2; 1 6 3]; % wrong size
    kenwat1.report(X)
    errorThrown = 0;
catch
    errorThrown = 1;
end

assertErrorThrown(errorThrown, 'report. data wrong size')

% testing report.m 
try 
    X = [1 1 1 1 1;2 2 2 2 2]; % non-positive Covariance
    kenwat1.report(X)
    errorThrown = 0;
catch
    errorThrown = 1;
end

assertErrorThrown(errorThrown, 'report. non-positive covariance')


% Subfunction
% Assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            fprintf('#%s\t\t',condition)
            fprintf('#success #\n');
        else
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected an error to be thrown')
        end
    end

end
