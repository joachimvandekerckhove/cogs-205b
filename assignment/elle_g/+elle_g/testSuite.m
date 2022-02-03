function tests = Norm2dTest
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
    
    verifyLessThan(testCase, abs(expectedValue-actualValue), eps(1))
end