function tests = PLFTest
% PowerLawFitterTest, Test Suite for PowerLawFitter
    tests = functiontests(localfunctions);
end

% Local test* functions as subfunctions
function testObservedRT(testCase)
    NonPositiveRT = [700 400 100 0 -300];
    badCall = @() kenwat1.PowerLawFitter(NonPositiveRT);

    verifyError(testCase, badCall, 'MATLAB:validators:mustBePositive')
end
 
function testCount(testCase)
    testdata = randi(300,1,30); %randomly selecting a set of integers
    ExpectedCount = length(testdata);
    actual = kenwat1.PowerLawFitter(testdata).Count;

    verifyEqual(testCase, ExpectedCount, actual, "AbsTol", eps(1))
end
 
function testEstimatedAsymptote(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedAsymptote;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedRange(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedRange;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedExposure(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedExposure;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedRate(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedRate;

    verifyGreaterThan(testCase,actual,0) 
end

function testExpectation(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    expected = length(testdata);
    actual = length(a.Expectation);

    verifyEqual(testCase, expected, actual, "AbsTol", eps(1))
end

function testSSE(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.SumOfSquaredError;

    verifyGreaterThan(testCase, actual, 0)
end

function testFit(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    actual = @() a.Fit;

    verifyWarningFree(testCase,actual)
end
 
function testdisp(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = @() a.disp;

    verifyWarningFree(testCase,actual)
end

% Tests for Bonus
function testNoRecompute(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = @() a.Fit;

    verifyError(testCase,actual,"Fit:ParametersAlreadySet")
end

function testChangeParameters(testCase)
    testdata1 = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata1);
    a.Fit;
    actual = a.EstimatedAsymptote;
    
    testdata2 = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 50;
    b = kenwat1.PowerLawFitter(testdata2);
    b.Fit;
    prohibited = b.EstimatedAsymptote;

    verifyNotEqual(testCase,actual,prohibited)
end