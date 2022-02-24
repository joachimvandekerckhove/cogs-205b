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

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

function testSSE(testCase)

    % TESTSSE    Tests sse function to verify value is positive
    data = [313   306   300   293   287   288   285   281   279   ...
            275   274   273   271   272   275   268   269   265   ...
            269   264   266   264   265   264   263];

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

function testFit(testCase)

    % TESTFIT    Tests Fit function with valid input to check if parameter
    % estimates updated
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905]';

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

function testDisp(testCase)

    % TESTDISP    Tests disp function with valid input
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905]';

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

% Bonus Tests
function testBonus1(testCase)

    % TESTBONUS1    Tests Fit function that should return value
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905]';

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end

function testBonus2(testCase)

    % TESTBONUS2    Tests Fit function that shouldn't return value
    data = [5.4694 -3.3563 1.1302 3.2101 5.4024 7.1768 1.3437 -4.9664 -1.9692 -3.2463; ...
            10.4018 -1.4624 3.9923 0.2303 4.5544 -2.0594 -4.6091 -4.6895 2.9528 0.2905]';

    actualValue   = @() lemontgomery2.report(data);
    
    verifyWarningFree(testCase, actualValue)
    
end