function tests = Norm2dTest
    tests = functiontests(localfunctions);
end

function testPdf(testCase)
    Mean = zeros(2, 1);    StandardDeviation = [1 0;0 1];    Value = zeros(2, 1);
    expected = mvnpdf(Value,Mean,StandardDeviation);
    actual   = hojjatazimi.Norm2d(Mean, StandardDeviation).pdf(Value);
    verifyEqual(testCase, expected, actual)
end

function testBadCov(testCase)
    Mean = zeros(2, 1);    StandardDeviation = [1 2;3 4];
    actual   = hojjatazimi.Norm2d(Mean, StandardDeviation);
    verifyError(testCase, actual, 'Must Be Symmetric!')    
end

function testEstimateMean(testCase)
    input = randn(2, 100);
    expected = mean(input, 2);
    actual = hojjatazimi.Norm2d.estimate(input).Mean;
    verifyEqual(testCase, expected, actual)
end