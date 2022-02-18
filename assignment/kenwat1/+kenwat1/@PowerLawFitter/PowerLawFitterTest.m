function tests = PowerLawFitterTest
% PowerLawFitterTest, Test Suite for PowerLawFitter
    tests = functiontests(localfunctions);
end

% Local test* functions as subfunctions
function testImagCheck(testCase)
    Mean       = [2+3*1i;4-2*1i];
    Covariance = eye(2);

    badCall = @() kenwat1.Norm2d(Mean,Covariance);

    verifyError(testCase, badCall, 'MATLAB:validators:mustBeReal')
end

function testWarningFree(testCase)
    Mean       = [2;4];
    Covariance = eye(2);

    actual = @() kenwat1.Norm2d(Mean,Covariance);

    verifyWarningFree(testCase,actual)
end

function testCorrelation(testCase)
    X = rand(2,10);

    newEstimate = kenwat1.Norm2d().estimate(X);
    expectedValue = newEstimate.Correlation;

    r = corrcoef(X(1,:),X(2,:));
    actualValue = r(1,2);

    verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))

end