function tests = PFLtests
% PFLtests  Create test suite for the power law fitter
    tests = functiontests(localfunctions);
end

% need one test for each property
function testObservedRT(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    elle_g.PowerLawFitter.set.ObservedRT(testInput;)
    actVal=get.ObservedRT(elle_g);
    verifyEqual(testCase, actVal, expVal)
end

function testCount(testCase)
    testInput=[1 2 3 4 5 6 7 8 9 10];
    expVal=length(testInput);
    set.Count(testInput);
    actVal=get.Count;
    verifyEqual(testCase, actVal, expVal);
end

function testEstimatedAsymptote(testCase)
end

function testEstimatedRange(testCase)
end

function testEstimatedExposure(testCase)
end

function testEstimatedRate(testCase)
end
% need one test for each method

function testExpectation(testCase)
end

function testSSE(testCase)
    fakeEst=444;
    
end

function testFit(testCase)
end

function testDisp(testCase)
end

