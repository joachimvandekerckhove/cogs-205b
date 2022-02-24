function tests = PFLtests
% PFLtests  Create test suite for the power law fitter
    tests = functiontests(localfunctions);
end

% need one test for each property
% CHECK THAT EACH PROPERTY ONLY HAS ONE VALUE SET!!
function testObservedRT(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    expVal=testInput;
    actVal=t.ObservedRT;
    verifyEqual(testCase, actVal, expVal)
end

function testCount(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.Count;
    expVal=length(testInput);
    verifyEqual(testCase, actVal, expVal);
end

function testEstimatedAsymptote(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.EstimatedAsymptote;
    verifyNumElements(testCase, actVal, 1)
end

function testEstimatedRange(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.EstimatedRange;
    verifyNumElements(testCase, actVal, 1)
end

function testEstimatedExposure(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.EstimatedExposure;
    verifyNumElements(testCase, actVal, 1)
end

function testEstimatedRate(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.EstimatedRate;
    verifyNumElements(testCase, actVal, 1)
end
% need one test for each method

function testExpectation(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    l=t.Expectation(1, 2, 3, 4);
    actVal=length(l);
    expVal=length(testInput);
    verifyEqual(testCase, expVal, actVal);
end

function testSSE(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    actVal=t.SumOfSquaredError(1, 2, 3, 4);
    expVal=1;
    verifyNumElements(testCase, actVal, expVal)
end

function testFit(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    t=PowerLawFitter.PowerLawFitter(testInput);
    verifyNotEmpty(testCase, t.EstimatedAsymptote);
    verifyNotEmpty(testCase, t.EstimatedRange);
    verifyNotEmpty(testCase, t.EstimatedExposure);
    verifyNotEmpty(testCase, t.EstimatedRate);
end

function testDisp(testCase)
    verifyWarningFree(testCase, @() PowerLawFitter.PowerLawFitter())
end

