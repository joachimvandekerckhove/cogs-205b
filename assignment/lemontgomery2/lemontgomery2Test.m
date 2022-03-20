function tests = lemontgomery2Test
    % LEMONTGOMERY2TEST    Create test suite for lemontgomery package
    tests = functiontests(localfunctions);
end


% Local test* functions as subfunctions
function testGetData(testCase)

    % TESTGETDATA    Tests getData function with empty url
    url = '';

    badcall   = @() lemontgomery2.getData(url);
    
    verifyError(testCase, badcall, 'MATLAB:urlencode:expectedNonempty')
    
end

function testReport1(testCase)

    % TESTREPORT1    Tests report function with incorrect dimensions
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905];
    
    badcall   = @() lemontgomery2.report(data);
    
    verifyError(testCase, badcall, 'MATLAB:validation:IncompatibleSize')

end

function testReport2(testCase)

    % TESTREPORT2    Tests report function with valid input
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905]';

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

function testNorm2d(testCase)

    % TESTNORM2D    Tests cdf function with valid inputs
    testMean              = [15; 8];
    testCovariance        = [45 1; 1 12];
    testStandardDeviation = sqrt(diag(testCovariance));
    
    this = lemontgomery2.Norm2d;

    expectedValue = 0;
    actualValue   = this.cdf(testMean - 20 * testStandardDeviation);
    
    verifyEqual(testCase, actualValue, expectedValue, "AbsTol", 1e-100)

end