function test(pseudonym)
% Set deadpool as default pseudonym
    if nargin<1
        pseudonym = 'deadpool';
    end

% Check for class Norm2d
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
    fprintf('#%-77s#\n', sprintf('  Test suite for "%s"  ', class(this)))

% print a line
    fprintf('#%s#\n', dashline); 

% Test for estimate function 
% Data matrix for test
    test.data = [-1,0,1;3.2,-2,-1.2]
% Reference: Mean vector using matlab function
    ref.mean = mean(test.data,2)
% Reference: Covariance matrix using matlab function
    ref.covariance = cov(test.data.')
% Reference: Precision matrix using matlab function
    ref.pres = inv(ref.covariance)
% Reference: Correlation from matlab function
    ref.cor = corr(test.data.')(1,2)
% New object with updated properties to be tested
    tobe_tested = this().estimate(test.data)

% Test that the mean is correct
    assertEqualUpToTol(ref.mean, tobe_tested.Mean, 'equallity of means')
% Test that the Covariance matrix is correct
    assertEqualUpToTol(ref.covariance, tobe_tested.Covariance, 'equallity of covariance matrix')
% Test that the Presicion matrix is correct    
    assertEqualUpToTol(ref.pres, tobe_tested.Precision, 'equallity of Presicion matrix')
% Test that the correlation is correct    
    assertEqualUpToTol(ref.cor, tobe_tested.Correlation, 'equality of correlation')

% Wrapup
    fprintf('#%s#\n', dashline);
    fprintf('# %74s  #\n', datestr(now))
    fprintf('#%-77s#\n', sprintf('  All tests passed for "%s"  ', class(this)))
    fprintf('#%s#\n', dashline);

% Assert an approximate equality
    function assertEqualUpToTol(a, b, condition)
        if all(abs(a-b) < 1e-10)
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected a==b:')
            a
            b
            throwAsCaller(failure(condition))
        end
    end

end