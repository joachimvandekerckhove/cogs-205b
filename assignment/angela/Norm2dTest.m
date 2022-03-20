function tests = Norm2dTest
% Create test suite for Norm2d class
    tests = functiontests(localfunctions);
end

% test cdf function
function testCdf(testCase)

    mean            = [2;2];
    covariance      = [2 1;1 2];
    value           = [linspace(1,10,10);linspace(10,1,10)];
    
    expectedValue   = mvncdf(value',mean',covariance)';
    actualValue     = angela.Norm2d(mean, covariance).cdf(value);
    
    verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))


end

% test inf value error
function testInfCheck(testCase)

    mean            = [Inf;Inf];
    covariance      = [1 0; 0 1];
    
    badCall         = @() angela.Norm2d(mean, covariance);
    
    verifyError(testCase, badCall, 'MATLAB:validators:mustBeFinite')

end

% test size of rnd output
function testRndSize(testCase)

    size = 5;
    
    actualSize = angela.Norm2d().rnd(size);
    expectedSize = [2,size];
    
    verifySize(testCase,actualSize,expectedSize)

end
