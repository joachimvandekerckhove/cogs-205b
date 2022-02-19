function tests = PowerLawFitterTest
% Create test suite for Norm2d class
tests = functiontests(localfunctions);
end

% test PowerLawFitter belongs to handle class
function testHandle(testCase)

    actual = PowerLawFitter;
    verifyInstanceOf(testCase,actual,?handle)

end

% test ObservedRT property will give error if it's not a vector
function testObservedRT(testCase)

    notAVector = [1 2 3; 4 5 6];
    
    badCall = @() PowerLawFitter(notAVector);
    
    verifyError(testCase, badCall, ?MException);

end

% test Count property will count number of data points
function testCount(testCase)

    randomData = ones(1,83);
    
    expectedValue = length(randomData);
    actualValue = PowerLawFitter(randomData).Count;
    
    verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))

end

% test EstimatedAsymptote property is a double
function testEstimatedAsymptoteIsDouble(testCase)

    this = PowerLawFitter;
    this.Fit

    actual = this.EstimatedAsymptote; 

    verifyClass(testCase,actual,?double)

end

% test EstimatedRange property is a double
function testEstimatedRangeIsDouble(testCase)

    this = PowerLawFitter;
    this.Fit

    actual = this.EstimatedRange; 

    verifyClass(testCase,actual,?double)

end

% test EstimatedExposure property
function testEstimatedExposureIsDouble(testCase)

    this = PowerLawFitter;
    this.Fit

    actual = this.EstimatedExposure; 

    verifyClass(testCase,actual,?double)

end

% test EstimatedRate property
function testEstimatedRateIsDouble(testCase)

    this = PowerLawFitter;
    this.Fit

    actual = this.EstimatedRate; 

    verifyClass(testCase,actual,?double)

end

% test Expectation method outputs a vector the same length as Count
function testExpectation(testCase)

    this = PowerLawFitter;
    actualLength = this.Expectation(1,1,1,1);
    expectedLength = this.Count;
    
    verifyLength(testCase,actualLength,expectedLength)  

end


% test SumOfSquaredError method outputs a single number
function testSSE(testCase)

    import matlab.unittest.constraints.IsScalar

    actual = PowerLawFitter().SumOfSquaredError;
    verifyThat(testCase,actual,IsScalar);

end


% test Fit method sets parameter estimates (lol how to do this in 1 
% function? ><" )
function testFitSetsParameterEstimatesPart1(testCase)

    import matlab.unittest.constraints.EveryCellOf
    import matlab.unittest.constraints.IsEmpty

    this = PowerLawFitter;
    emptyParameters = {this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate};
    
    verifyThat(testCase,EveryCellOf(emptyParameters),IsEmpty);

end
function testFitSetsParameterEstimatesPart2(testCase)

    import matlab.unittest.constraints.EveryCellOf
    import matlab.unittest.constraints.IsEmpty

    this = PowerLawFitter;
    this.Fit()
    fittedParameters = {this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate};
    
    verifyThat(testCase,EveryCellOf(fittedParameters),~IsEmpty);

end

% test fit takes zero inputs 
function testFit(testCase)

    input = 83;
    actual = @() PowerLawFitter().Fit(input);

    verifyError(testCase,actual,'MATLAB:TooManyInputs')

end


% test disp method
function testDisp(testCase)

    verifyWarningFree(testCase,@() PowerLawFitter)

end

%%% BONUS %%%
% test that user cannot extract outdated parameter estimates
function testOutdatedEstimates(testCase)

    import matlab.unittest.constraints.EveryCellOf
    import matlab.unittest.constraints.IsEmpty

    this = PowerLawFitter;
    this.Fit;
    this.ObservedRT = this.ObservedRT + 1;
    actual = {this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate};
    
    verifyThat(testCase,EveryCellOf(actual),IsEmpty);

end

% test that fit will re-estimate if data changes
function testReFit(testCase)
    
    this = PowerLawFitter;
    this.Fit;
    oldParams = [this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate];
    this.ObservedRT = this.ObservedRT + 1;
    this.Fit;
    newParams = [this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate];
    
    verifyNotEqual(testCase,oldParams,newParams)

end

% how to test that fit will NOT re-estimate if data doesn't change? 


