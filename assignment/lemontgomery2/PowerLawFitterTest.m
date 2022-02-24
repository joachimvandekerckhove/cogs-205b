function tests = PowerLawFitterTest
    % POWERLAWFITTERTEST    Create test suite for PowerLawFitter class
    tests = functiontests(localfunctions);
end


% Property tests
function testObservedRT(testCase)

    % TESTOBSERVEDRT    Tests ObservedRT is double
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];

    this = lemontgomery2.PowerLawFitter(data);
        
    verifyClass(testCase, this.ObservedRT, ?double)
    
end
    
function testCount(testCase)

    % TESTCOUNT    Tests if Count is scalar
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    
    verifyClass(testCase, this.Count, ?double)
    
end

function testEstimatedAsymptote(testCase)

    % TESTESTIMATEDASYMPTOTE    Tests EstimatedAsymptote property updated
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
        
    verifyNotEmpty(testCase, this.EstimatedAsymptote)
    
end

function testEstimatedRange(testCase)

    % TESTESTIMATEDRANGE    Tests EstimatedRange property updated
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    
    verifyNotEmpty(testCase, this.EstimatedRange)
    
end

function testEstimatedExposure(testCase)

    % TESTESTIMATEDEXPOSURE    Tests EstimatedExposure property updated
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    
    verifyNotEmpty(testCase, this.EstimatedExposure)
    
end

function testEstimatedRate(testCase)

    % TESTESTIMATEDRATE    Tests EstimatedRate property updated
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    
    verifyNotEmpty(testCase, this.EstimatedRate)
    
end

function testPreviousData(testCase)

    % TESTPREVIOUSDATA    Tests PreviousData property starts empty
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
        
    this = lemontgomery2.PowerLawFitter(data);
    
    verifyEmpty(testCase, this.PreviousData)
    
end

% Method tests
function testExpectation(testCase)

    % TESTEXPECTATION    Tests expectation function to verify correct size
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
    x = [20, 50, 1, 0];
    
    this = lemontgomery2.PowerLawFitter(data);
    actualValue   = this.expectation(x);
    actualSize    = [1 25];
    
    verifySize(testCase, actualValue, actualSize)
    
end

function testSSE(testCase)

    % TESTSSE    Tests sse function to verify value is positive
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
    testData = randperm(313, 25);
    
    this = lemontgomery2.PowerLawFitter(data);
    actualValue   = this.sse(testData);
        
    verifyGreaterThanOrEqual(testCase, actualValue, 0)
    
end

function testFit(testCase)

    % TESTFIT    Tests Fit function with valid input to check if parameter
    % estimate updated
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];

    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    actualValue = this.EstimatedAsymptote;
    
    verifyNotEmpty(testCase, actualValue)
    
end

function testDisp(testCase)

    % TESTDISP    Tests disp function with valid input
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];

    this = lemontgomery2.PowerLawFitter(data);
    actualValue = @() this.disp;
    
    verifyWarningFree(testCase, actualValue)
    
end

% Bonus Tests
function testBonus1(testCase)

    % TESTBONUS1    Tests Fit function that should return new value
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
    testData = randperm(313, 25);
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    actualValue = this.EstimatedAsymptote;
    
    this2 = lemontgomery2.PowerLawFitter(testData);
    this2.Fit;
    actualValue2  = this2.EstimatedAsymptote;
    
    verifyNotEqual(testCase, actualValue, actualValue2)
    
end

function testBonus2(testCase)

    % TESTBONUS2    Tests Fit function that shouldn't return value
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];
    testData = randperm(313, 25);
        
    this = lemontgomery2.PowerLawFitter(data);
    this.Fit;
    actualValue = this.EstimatedAsymptote;
    
    this2 = lemontgomery2.PowerLawFitter(testData);
    actualValue2 = this2.EstimatedAsymptote;
    
    verifyNotEqual(testCase, actualValue, actualValue2)
    
end