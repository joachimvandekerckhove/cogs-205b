function tests = NormalTest
% NORMALTEST  Create test suite for Normal class
    tests = functiontests(localfunctions);
end


% Local test* functions as subfunctions
function testPdf(testCase)
    Mean              = 1;
    StandardDeviation = 2;
    Value             = 0;

    expectedValue = normpdf(Value, Mean, StandardDeviation);
    actualValue   = Normal(Mean, StandardDeviation).pdf(Value);
    
    verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))
end


% Local test* functions as subfunctions
function testInfCheck(testCase)
    Mean              = Inf;
    StandardDeviation = 2;
    
    badCall = @() Normal(Mean, StandardDeviation);
    
    verifyError(testCase, badCall, 'MATLAB:validators:mustBeFinite')

end
