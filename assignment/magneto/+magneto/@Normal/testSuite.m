function testSuite()
% TESTSUITE  Runs unit tests for a magneto.Normal object

this = magneto.Normal();


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
testMean               = 5;
testStandardDeviation  = 4;
testVariance           = testStandardDeviation * testStandardDeviation;
testPrecision          = 1/testVariance;

% test that the mean sticks
this.Mean = testMean;
assertEqualUpToTol(this.Mean, testMean, ...
    'setMean / getMean')

% test that the standard deviation sticks
this.StandardDeviation = testStandardDeviation;
assertEqualUpToTol(this.StandardDeviation, testStandardDeviation, ...
    'setStandardDeviation / getStandardDeviation')

% test that the precision is correct
assertEqualUpToTol(this.Precision, testPrecision, ...
    'setStandardDeviation / getPrecision')

% test that the variance is correct
assertEqualUpToTol(this.Variance, testVariance, ...
    'setStandardDeviation / getVariance')


%% Tests of compute functions

assertEqualUpToTol(this.pdf(testMean), 0.024933892525090, ...
    'pdf . max height')

assertLessThan(this.pdf(testMean - 1e-5), this.pdf(testMean), ...
    'pdf . mode left')

assertLessThan(this.pdf(testMean + 1e-5), this.pdf(testMean), ...
    'pdf . mode right')

assertEqualUpToTol(this.pdf(testMean - 20 * testStandardDeviation), 0, ...
    'pdf . left tail')

assertEqualUpToTol(this.pdf(testMean + 20 * testStandardDeviation), 0, ...
    'pdf . right tail')


assertEqualUpToTol(this.cdf(testMean), 0.5, ...
    'cdf . median')

assertLessThan(this.cdf(testMean - 1e-5), 0.5, ...
    'cdf . median left')

assertLessThan(0.5, this.cdf(testMean + 1e-5), ...
    'cdf . median right')

assertEqualUpToTol(this.cdf(testMean - 20 * testStandardDeviation), 0, ...
    'cdf . left tail')

assertEqualUpToTol(this.cdf(testMean + 20 * testStandardDeviation), 1, ...
    'cdf . right tail')


%% Tests of random number generation

rng(0)
r1 = this.rnd([2 2]);

rng(0)
r2 = this.rnd([2 2]);

assertEqualUpToTol(r1, r2, ...
    'rnd . seeded')


%% Tests of interfaces

testMean = [1 2 3; 4 5 6];

assertSameSize(this.pdf(testMean), testMean, ...
    'pdf . same size')

assertSameSize(this.cdf(testMean), testMean, ...
    'cdf . same size')

assertSameSize(this.rnd(size(testMean)), testMean, ...
    'rnd . same size')


%% Wrap up

fprintf('#%s#\n', dashline);
fprintf('# %74s  #\n', datestr(now))
fprintf('#%-77s#\n', sprintf('  All tests passed for "%s"  ', class(this)))
fprintf('#%s#\n', dashline);


%% Subfunctions

    % Assert an approximate equality
    function assertEqualUpToTol(a, b, condition)
        if all(abs(a-b) < 1e-10)
            fprintf('# %-67s ', sprintf(' %s', condition));
            lookBusy(3)
            fprintf('passed  #\n');
        else
            fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
            fprintf('#%s#\n', dashline);
            disp(a)
            disp(b)
            error('TESTSUITE failed for condition "%s"', condition)
        end
    end

    % Assert an inequality
    function assertLessThan(a, b, condition)
        if (a < b)
            fprintf('# %-67s ', sprintf(' %s', condition));
            lookBusy(2)
            fprintf('passed  #\n');
        else
            fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
            fprintf('#%s#\n', dashline);
            disp(a)
            disp(b)
            error('TESTSUITE failed for condition "%s"', condition)
        end
    end

    % Assert that two matrices have the same dimensions
    function assertSameSize(a, b, condition)
        if isequal(size(a), size(b))
            fprintf('# %-67s ', sprintf(' %s', condition));
            lookBusy(1)
            fprintf('passed  #\n');
        else
            fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
            fprintf('#%s#\n', dashline);
            disp(a)
            disp(b)
            error('TESTSUITE failed for condition "%s"', condition)
        end
    end

    % If reports generate too fast, people don't believe they did anything
    function lookBusy(k)
        for r = 1:k
            for s = '\|/-'
                fprintf('%s', s);
                pause(.015)
                fprintf('\b');
            end
        end
    end

end
