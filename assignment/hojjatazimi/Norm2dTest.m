function tests = Norm2dTest
    tests = functiontests(localfunctions);
end

function testPdf(testCase)
    Mean = zeros(2, 1);    StandardDeviation = [1 0;0 1];    Value = zeros(2, 1);
    expected = mvnpdf(Value,Mean,StandardDeviation);
    actual   = hojjatazimi.Norm2d(Mean, StandardDeviation).pdf(Value);
    verifyLessThan(testCase, abs(expected-actual), eps(1))
end

function testBadCov(testCase)
    Mean = zeros(2, 1);    StandardDeviation = [1 2;3 4];
    % FIXED: The way to verify an error is to pass a function call that
    % generates it:
    actual   = @()hojjatazimi.Norm2d(Mean, StandardDeviation);
    verifyError(testCase, actual, 'Norm2d:setCovariance:mustBeSymmetric')    
end

function testEstimateMean(testCase)
    input = randn(2, 100);
    expected = mean(input, 2);
    actual = hojjatazimi.Norm2d.estimate(input).Mean;
    verifyLessThan(testCase, abs(expected-actual), eps(1))
end