function tests = PowerLawFitterTest
 % create test suite for PowerLawFitter class
     tests = functiontests(localfunctions);
end

%% Test PowerLawFitterTest() class

% wrong dimension of ObservedRT
function testConstructorDimensions(testCase)
    ObservedRT = [313 306 300 293 287 288 285 281 279 275 274 273;
                  271 272 275 268 269 265 269 264 266 264 265 264]; 
    badCall = @() isaacmenchaca.PowerLawFitter(ObservedRT); 
    verifyError(testCase, badCall, 'MATLAB:validation:IncompatibleSize')
end 

% Negative values of ObservedRT
function testNonnegativeRTs(testCase)
    ObservedRT = [-313 -306 -300 -293 -287 -288 285 281 279 275 274 273]; 
    badCall = @() isaacmenchaca.PowerLawFitter(ObservedRT); 
    verifyError(testCase, badCall, 'MATLAB:validators:mustBePositive')
end

% Test assigned value of Count.
function testCount(testCase)
    ObservedRT = [313 306 300 293 287 288 285 281 279 275 274 273]; 
    expectedVal = length(ObservedRT);
    actualVal = isaacmenchaca.PowerLawFitter(ObservedRT).Count; 
    verifyEqual(testCase, expectedVal, actualVal);
end

% Verify Expectation produces an output and has a same size as ObservedRT.
function testExpectationOutput(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    
    expectedVal = size(ObservedRT);
    actualVal = size(x.Expectation(250.668, 608.976, 6.587, 1.121));
    verifyEqual(testCase, expectedVal, actualVal);
end

% Verify SumOfSquaredError produces a scalar output.
function testSumOfSquaredErrorOutput(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    
    expectedVal = 1;
    actualVal = length(x.SumOfSquaredError(250.668, 608.976, 6.587, 1.121));
    
    verifyEqual(testCase, expectedVal, actualVal);
end

% Verify optimal parameters of Fit and consistent Expectation/ SSE between SumOfSquaredError and Fit.
function testSSEFitOutput(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    x.Fit()
    
    expectedVal = x.SumOfSquaredError(250.668, 608.976, 6.587, 1.121);
    actualVal = x.EstimatedLoss();
    verifyEqual(testCase, expectedVal, actualVal, "AbsTol", .1);
end


% Verify that Fit will update params.
function testFitUpdatesParams(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    x.Fit()
    actualVal = [x.EstimatedAsymptote,  x.EstimatedRange, x.EstimatedExposure, x.EstimatedRate];
    verifyNotEmpty(testCase, actualVal);
end


% Verify that setting new data to obj.ObservedRT will clear params.
function testChangeObservedRT(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    x.Fit()
    x.ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272];
    
    expectedVal = [];
    actualVal = [x.EstimatedAsymptote,  x.EstimatedRange, x.EstimatedExposure, x.EstimatedRate];
    verifyEqual(testCase, expectedVal, actualVal);
end

% test disp runs without error.
function testDisp(testCase)    
    verifyWarningFree(testCase, @ () isaacmenchaca.PowerLawFitter().disp)
end


% Verify that that Fit does not recompute.
function testFitRecompute(testCase)
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    x.Fit()
    badCall = @() x.Fit(); 
    verifyError(testCase, badCall, 'recomputedFit:unchangedData')
end

% test plotConvergence runs without error.
function testPlot(testCase)  
    ObservedRT = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 ...
                    275 268 269 265 269 264 266 264 265 264 263 ];
    x = isaacmenchaca.PowerLawFitter(ObservedRT);
    x.Fit()
    verifyWarningFree(testCase, @ () x.plotConvergence)
end