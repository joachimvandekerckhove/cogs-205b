%test suite of the functions in the package
% making sure they all work without errors as intended and give the expected output.
function test()

% define line variable
dashline = repmat('-', 1, 88);

%  line
fprintf('%s\n', dashline);

%  time and date
fprintf('~ %83s  ~\n', datestr(now))

%   title
fprintf('~%-84s~\n', sprintf('  Test suite for elle_g/+elle_g/@Norm2d'))

%  line
fprintf('%s\n', dashline);

% test for: estimate
try
    X=[2 2 2; 4 4 4];
    elle_g.Norm2d.estimate(X)
    X.Mean==[2;4];
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'estimate mean. mean is correct.')

try
    X=[2 2 2; 4 4 4];
    length(X(1, :))==length(X(2, :));
    errorThrown = true;
catch
    errorThrown = false;
end
assertErrorThrown(errorThrown, 'estimate covariance. data sets are equal in length')

try
    X=[1 2 3; 10 20 30];
    elle_g.Norm2d.estimate(X)
    X.Covariance==[1 10;10 100];
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'estimate mean. covariance is correct.')


% test for: getData
try
    wontWork="http://mynewpuppyisnamedlady.com/";
    elle_g.getData(wontWork)
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'getData. url cannot be accessed')


%test for: readData
try
   data2read='http://cidlab.com/files/cogs205b.csv';
   elle_g.readData(data2read);
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'readData. successfully downloads file')


% test for: report
try
    X=[1 2 3; 10 20 30];
    elle_g.report(X);
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'report. report successfully generated');


% test for: main
try
    elle_g.main();
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'main. class data downloaded with all methods functional')

%test for: Contents
try
    elle_g.Contents();
    errorThrown = false;
catch
    errorThrown = true;
end
assertErrorThrown(errorThrown, 'Contents. help docs displayed')

% Assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            success(condition)
        else
            fprintf('%s\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected an error to be thrown')
            throwAsCaller(failure(condition))
        end
    end

% Success message
    function success(condition)
        fprintf(' %-78s ', sprintf(' %s', condition));
        fprintf('PASSSSSSSED!!  ~\n');
    end

% failure message
    function me = failure(condition)
        fprintf('~ %-78s failed  ~\n', sprintf(' %s', condition));
        fprintf('~%s~\n', dashline);
        me = ...
            MException('badnewsbears:testSuite', ...
            sprintf('the test failed for condition "%s"',condition));
    end

end 