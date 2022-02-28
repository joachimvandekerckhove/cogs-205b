function tests=powerlawfittertestsuite
    %powerlawfittertestsuite runs a test for powerlawfitter functions
    tests=functiontests(localfunctions);
end
function testObservedRT(testCase)
obs=[2 3 4 inf];
badCall= @() marjan.powerlawfitter(obs);
verifyError(testCase,badCall, 'MATLAB:validators:mustBeFinite')
end
%% test count property
function testCount(testCase)
    Data=[2 3 6 7 8 10];
    expected=size(Data, 2);
    actual=marjan.powerlawfitter(Data).Count;
    verifyEqual(testCase, actual, expected)
end

 %% test EstimatedAsymptote size


function testestimatedasymptoteSize(testCase)
   data=[313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
   a=marjan.powerlawfitter(data);
   a.fit
   expected=[1,1];
   actual=a.EstimatedAsymptote;
   verifySize(testCase, actual, expected)
end
% %% test EstimatedAsymptote class
function testestimatedasymptoteClass(testCase)
   data=[313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
   a=marjan.powerlawfitter(data);
   a.fit
   expected= ?double;
   actual=a.EstimatedAsymptote;
   verifyClass(testCase, actual, expected)
end
% %% test EstimatedRange
function testestimatedrangeSize(testCase)
    a=marjan.powerlawfitter;
    a.fit
    expected=[1,1];
    actual=a.EstimatedRange;
    verifySize(testCase, actual, expected)
end
%  %% test EstimatedExposure
function testestimatedexposureSize(testCase)
    a=marjan.powerlawfitter;
    a.fit
    expected=[1,1];
    actual=a.EstimatedExposure;
    verifySize(testCase, actual, expected)
end
% %% test EstimatedRate
function testestimatedrateSize(testCase)
    a=marjan.powerlawfitter;
    a.fit
    expected=[1,1];
    actual=a.EstimatedRate;
    verifySize(testCase, actual, expected)
end
% %% test Expectation
function testexpectation(testCase)
    a=marjan.powerlawfitter;
%     a.fit
    exist=a.Expectation(200,300,1,1);
    verifyNotEmpty(testCase,exist)
end
%test sumofsquarederror
function testSumOfSquaredError(testCase)
    a=marjan.powerlawfitter;
    parameters = [300,200,2,2];
    actual=a.SumofSquaredError(parameters);
	verifyGreaterThanOrEqual(testCase,actual,0)

end
%test print
function testPrintAll(testCase)
    a=marjan.powerlawfitter;
    a.fit
    actual = evalc('a.printAll()');
    verifyClass(testCase,actual,?char)
end
%test fit
function testfit(testCase)
   data=[313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
   a=marjan.powerlawfitter(data);
   actual= @() a.fit;
   verifyNotEmpty(testCase,actual)
end
