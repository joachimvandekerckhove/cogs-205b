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

    % TESTREADDATA    Tests readData function with invalid url
    data = [1 2 3; 4 5 6; 7 8 9];
    
    expectedValue = 'data is of incorrect dimensions, it should be Nx2';
    actualValue   = lemontgomery2.readData(data);
    
    verifyError(testCase, actualValue, expectedValue)

end
