% It is a basic test suite of the functions in this JieWanHW package, PowerLawFitter class.
% HW5
function tests = testPowerLawFitter
    tests = functiontests(localfunctions);
end

function testObservedRT(testCase)
    
    testdat = [-1 -2 -3 -4 -5];
    
    badCall = @() JieWanHW.PowerLawFitter(testdat);
    
    verifyError(testCase, badCall, 'MATLAB:validators:mustBePositive')

end

function testCount(testCase)

    testdat = [5 4 3 2 1];
    reallength = length(testdat);
    
    result = JieWanHW.PowerLawFitter(testdat);
    
    verifyEqual(testCase, result.Count, reallength)

end

function testEstimatedAsymptote(testCase)

    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = result.EstimatedAsymptote;

    verifySize(testCase, actual, [1, 1])

end

function testEstimatedRange(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = result.EstimatedRange;

    verifyGreaterThan(testCase,actual,0)

end

function testEstimatedExposure(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = result.EstimatedExposure;

    verifySize(testCase, actual, [1, 1])

end

function testEstimatedRate(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = result.EstimatedRate;

    verifyGreaterThan(testCase,actual,0)

end

function testExpectation(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = @() Expectation(result);
    
    verifyWarningFree(testCase, actual)

end

function testSumOfSquaredError(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = SumOfSquaredError(result);

    verifyGreaterThan(testCase,actual,0)

end

function testFit(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    actual = @() result.Fit;
    
    verifyWarningFree(testCase, actual)

end

function testdisp(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    actual = @() SumOfSquaredError(result);
    
    verifyWarningFree(testCase, actual)

end

function testNewData(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    newdat = [5 4 3 2 1];

    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    result.ObservedRT = newdat;
    
    verifyEmpty(testCase,result.EstimatedAsymptote)

end

function testOldData(testCase)
    
    testdat = [313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    
    result = JieWanHW.PowerLawFitter(testdat);
    result.Fit
    result.ObservedRT = testdat;
    
    verifyNotEmpty(testCase,result.EstimatedAsymptote)

end