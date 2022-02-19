function tests = Norm2dTest
% Create test suite for Norm2d class
    tests = functiontests(localfunctions);
end

% test Infinite values
function testInfCheck(testCase)
    Means              = [Inf,Inf];
    Covariance         = [1 0; 0 1];    
    badCall = @() adri.Norm2d(Means, Covariance);    
    verifyError(testCase, badCall, 'MATLAB:validators:mustBeFinite')
end

% test getData function
function testGetData(testCase)
    url = 'www.adriland.com';
    badcall   = @() adri.getData(url);  
    verifyError(testCase, badcall, 'MATLAB:requireValidURL')    
end

% test cdf function
function testFx(testCase)
    Means            = [1 7];
    Covariance       = [5 1;1 5];
    values           = [linspace(1,50,5);linspace(50,1,5)];
    
    expectedValue   = mvncdf(values',Means,Covariance)';
    actualValue     = adri.Norm2d(Means, Covariance).cdf(values);    
    verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))
end
