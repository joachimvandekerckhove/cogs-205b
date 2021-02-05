% TESTSUITE  Runs unit tests for a Norm2d object
% Supply a Norm2d object to test

function testSuite(this)


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


%% Tests of getters and setters

% make some parameters
testMean        = [15; 8];
testCovariance  = [45 1; 1 12];

testStandardDeviation = sqrt(diag(testCovariance));

ref = Norm2d(testMean, testCovariance);

% test that the mean sticks
this.Mean = testMean;
assertEqualUpToTol(this.Mean, testMean, ...
    'setMean / getMean')

% test that the standard deviation sticks
this.Covariance = testCovariance;
assertEqualUpToTol(this.Covariance, testCovariance, ...
    'setCovariance / getCovariance')

% test that the precision is correct
assertEqualUpToTol(this.Precision, ref.Precision, ...
    'setCovariance / getPrecision')

% test that the variance is correct
assertEqualUpToTol(this.Correlation, ref.Correlation, ...
    'setCovariance / getCorrelation')


%% Negative tests confirm that errors are thrown when expected

try
    this.Mean = 1:3;  % bad mean
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setMean . enforce size (length)')


try
    this.Mean = magic(2);  % bad mean
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setMean . enforce size (dimensions)')


try
    this.Mean = 1i+(1:2);  % bad mean
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setMean . enforce real')


try
    this.Mean = [Inf 1];  % bad mean
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setMean . enforce finite (positive)')


try
    this.Mean = [-Inf 1];  % bad mean
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setMean . enforce finite (negative)')


try
    this.Covariance = [1 2 3; 0 1 3];
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setCovariance . enforce size (columns)')


try
    this.Covariance = [1 2 3; 0 1 3]';
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setCovariance . enforce size (rows)')


try
    this.Covariance = [1 2; 1 3];
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setCovariance . enforce symmetric')


try
    this.Covariance = 0;
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setCovariance . enforce positive definite (zeros)')


try
    this.Covariance = [0 1; 1 0];
    errorThrown = false;
catch
    errorThrown = true;
end

assertErrorThrown(errorThrown, 'setCovariance . enforce positive definite (off-diagonal)')



%% Tests of compute functions

assertEqualUpToTol(this.pdf(testMean*0), ref.pdf(testMean*0), ...
    'pdf . height at 0')

assertEqualUpToTol(this.pdf(testMean), ref.pdf(testMean), ...
    'pdf . height at mean')

assertEqualUpToTol(this.pdf(testMean+diag(testCovariance)), ...
    ref.pdf(testMean+diag(testCovariance)), ...
    'pdf . height at +1SD')

assertEqualUpToTol(this.pdf(testMean-diag(testCovariance)), ...
    ref.pdf(testMean-diag(testCovariance)), ...
    'pdf . height at -1SD')

assertLessThan(this.pdf(testMean - 1e-5), this.pdf(testMean), ...
    'pdf . left from mode is lower')

assertLessThan(this.pdf(testMean + 1e-5), this.pdf(testMean), ...
    'pdf . right from mode is lower')

assertEqualUpToTol(this.pdf(testMean - 20 * testStandardDeviation), 0, ...
    'pdf . left tail is 0 at +20SD')

assertEqualUpToTol(this.pdf(testMean + 20 * testStandardDeviation), 0, ...
    'pdf . right tail is 0 at -20SD')



%% Tests of the cdf method

assertEqualUpToTol(this.cdf(testMean - 20 * testStandardDeviation), 0, ...
    'cdf . left tail')

assertEqualUpToTol(this.cdf(testMean + 20 * testStandardDeviation), 1, ...
    'cdf . right tail')



%% Some tests that only work on orthogonal cases

this.Covariance = eye(2);

assertEqualUpToTol(this.cdf(testMean), 0.25, ...
    'cdf . at median is 1/4')

assertLessThan(this.cdf(testMean - 1e-5), 0.25, ...
    'cdf . goes down left')

assertLessThan(0.25, this.cdf(testMean + 1e-5), ...
    'cdf . goes up right')

this.Covariance = testCovariance;



%% Tests of random number generation

rng(0); r1 = this.rnd(4);

assertSameSize(r1, zeros(2,4), 'rnd . correct size')

rng(0), r2 = this.rnd(4);

assertEqualUpToTol(r1, r2, 'rnd . seeded')


%% Tests of interfaces

testMean = [1 2 3; 4 5 6];

assertSameSize(this.pdf(testMean), ref.pdf(testMean), ...
    'pdf . correct size')

assertSameSize(this.cdf(testMean), ref.cdf(testMean), ...
    'cdf . correct size')

assertSameSize(this.rnd(8), ref.rnd(8), ...
    'rnd . correct size')


%% Wrap up

fprintf('#%s#\n', dashline);
fprintf('# %74s  #\n', datestr(now))
fprintf('#%-77s#\n', sprintf('  All tests passed for "%s"  ', class(this)))
fprintf('#%s#\n', dashline);


%% Subfunctions

    % Assert an approximate equality
    function assertEqualUpToTol(a, b, condition)
        if all(abs(a-b) < 1e-10)
            success(condition)
        else
            disp(a)
            disp(b)
            throwAsCaller(failure(condition))
        end
    end

    % Assert an inequality
    function assertLessThan(a, b, condition)
        if all(a < b)
            success(condition)
        else
            throwAsCaller(failure(condition))
        end
    end

    % Assert that two matrices have the same dimensions
    function assertSameSize(a, b, condition)
        if isequal(size(a), size(b))
            success(condition)
        else
            throwAsCaller(failure(condition))
        end
    end

    % Assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            success(condition)
        else
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
%                 pause(.025)
                fprintf('\b');
            end
        end
    end

end
