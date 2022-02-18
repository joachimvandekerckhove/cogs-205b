function tests = PowerLawFitterTest
% Create test suite for Norm2d class
tests = functiontests(localfunctions);
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

% test EstimatedAsymptote property
% function testEstimatedAsymptote(testCase)
% 
%     
% 
% end

% test EstimatedRange property

% test EstimatedExposure property

% test EstimatedRate property

% test Expectation method outputs a vector the same length as Count
function testExpectation(testCase)

    this = PowerLawFitter;
    actualLength = this.Expectation(1,1,1,1);
    expectedLength = this.Count;
    
    
    verifyLength(testCase,actualLength,expectedLength)  

end


% test SumOfSquaredError method outputs a single number
function testSSE(testCase)

    expectedSize = [1 1];
    actualSize = PowerLawFitter().SumOfSquaredError;
    verifySize(testCase,actualSize,expectedSize);

end


% test Fit method





% test disp method




%%% BONUS %%%
% test that user cannot extract outdated parameter estimates
function testOutdatedEstimates(testCase)

    this = PowerLawFitter;
    this.Fit;
    this.ObservedRT = this.ObservedRT + 1;
    actual = {this.EstimatedAsymptote,this.EstimatedRange,this.EstimatedExposure,this.EstimatedRate};

    import matlab.unittest.constraints.EveryCellOf
    import matlab.unittest.constraints.IsEmpty
    
    verifyThat(testCase,EveryCellOf(actual),IsEmpty);

end

% test that fit will not recompute if data have not changed
% function testFitTwice(testCase)
% 
%     this = PowerLawFitter;
%     this.Fit;
%     originalHandle = this.EstimatedAsymptote;
%     this.Fit;
%     newHandle = this.EstimatedAsymptote;
%     
%     verifySameHandle(testCase,originalHandle,newHandle);
% 
% 
% end




