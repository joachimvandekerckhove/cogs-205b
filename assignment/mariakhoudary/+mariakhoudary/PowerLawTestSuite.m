function tests = PowerLawTestSuite

% POWERLAWTESTSUITE uses MATLAB unit testing to run a testsuite for methods
% of PowerLawFitter

tests = functiontests(localfunctions);
end

%% test that ERT returns a vector of length Count
function testERTOutput(testCase)
    input = [390 203 439 320 304];
    parameters = [300, 100, 5, 1];
    ERT = mariakhoudary.PowerLawFitter(input).Expectation(parameters);
    verifyEqual(testCase, size(ERT), size(input))
end

%% test that SSE returns a positive scalar
function testSSEOutput(testCase)
    input = [313 306 300 293 287 288];
    parameters = [300, 100, 5, 1];
    SSE = mariakhoudary.PowerLawFitter(input).SumOfSquaredError(parameters);
    verifyGreaterThan(testCase, SSE, 0)
    verifyTrue(testCase, isscalar(SSE))
end

%% test that Fit updates PowerLaw properties
function testFit(testCase)
    input = [313 306 300 293 287 288];
    obj = mariakhoudary.PowerLawFitter(input);
    obj.Fit;
    verifyNotEmpty(testCase, obj.EstimatedAsymptote)
    verifyNotEmpty(testCase, obj.EstimatedRange)
    verifyNotEmpty(testCase, obj.EstimatedExposure)
    verifyNotEmpty(testCase, obj.EstimatedRate)
end

%% test that disp doesn't throw warnings
function testDisp(testCase)
    verifyWarningFree(testCase, @() mariakhoudary.PowerLawFitter)
end
    

    