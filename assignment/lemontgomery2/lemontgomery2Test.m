function tests = lemontgomery2Test
    % LEMONTGOMERY2TEST    Create test suite for lemontgomery package
    tests = functiontests(localfunctions);
end


% Local test* functions as subfunctions
function testGetData(testCase)

    % TESTGETDATA    Tests getData function with empty url
    url = '';

    expectedValue = webread(url);
    actualValue   = lemontgomery2.getData(url);
    
    verifyError(testCase, actualValue, expectedValue)
    
end

function testReadData(testCase)

    % TESTREADDATA    Tests readData function with incorrect dimensions
    data = 'tempValues.csv';
    
    expectedValue = 'data is of incorrect dimensions, it should be Nx2';
    actualValue   = lemontgomery2.readData(data);
    
    verifyError(testCase, actualValue, expectedValue)

end

function testReport(testCase)

    % TESTREPORT    Tests report function with valid input
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
    
    verifyEqual(testCase, actualValue, expectedValue)

end