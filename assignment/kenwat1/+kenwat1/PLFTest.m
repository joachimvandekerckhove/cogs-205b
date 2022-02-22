function tests = PLFTest
% PowerLawFitterTest, Test Suite for PowerLawFitter
    tests = functiontests(localfunctions);
end

% Local test* functions as subfunctions
function testObservedRT(testCase)
    NonPositiveRT = [700 400 100 0 -300];
    badCall = @() kenwat1.PowerLawFitter(NonPositiveRT);

    verifyError(testCase, badCall, 'MATLAB:validators:mustBePositive')
end
 
function testCount(testCase)
    testdata = randi(300,1,30); %randomly selecting a set of integers
    ExpectedCount = length(testdata);
    actual = kenwat1.PowerLawFitter(testdata).Count;

    verifyEqual(testCase, ExpectedCount, actual, "AbsTol", eps(1))
end
 
function testEstimatedAsymptote(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedAsymptote;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedRange(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedRange;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedExposure(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedExposure;

    verifyGreaterThan(testCase,actual,0) 
end

function testEstimatedRate(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263];
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    actual = a.EstimatedRate;

    verifyGreaterThan(testCase,actual,0) 
end

function testExpectation(testCase)
    testdata = [275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263] + 100;
    a = kenwat1.PowerLawFitter(testdata);
    a.Fit;
    expected = length(testdata);
    actual = length(a.Expectation);

    verifyEqual(testCase, expected, actual, "AbsTol", eps(1))
end

%  function testSSE(testCase)
%     randgen = randi(100,1,30)+270; %randomly selecting a set of integers from 270 to 350
%     testdata = sort(randgen,'descend');
%     a = kenwat1.PowerLawFitter(testdata);
%     a.Fit;
%     actual = [a.EstimatedAsymptote, a.EstimatedRange,...
%         a.EstimatedExposure, a.EstimatedRate];
% 
%     verifyGreaterThan(testCase,actual,[0 0 0 0]) 
%  end
%  
%  function testFit(testCase)
%     randgen = randi(100,1,30)+270; %randomly selecting a set of integers from 270 to 350
%     testdata = sort(randgen,'descend');
%     a = kenwat1.PowerLawFitter(testdata);
%     a.Fit;
%     actual = [a.EstimatedAsymptote, a.EstimatedRange,...
%         a.EstimatedExposure, a.EstimatedRate];
% 
%     verifyGreaterThan(testCase,actual,[0 0 0 0]) 
%  end
%  
%  function testdisp(testCase)
%     randgen = randi(100,1,30)+270; %randomly selecting a set of integers from 270 to 350
%     testdata = sort(randgen,'descend');
%     a = kenwat1.PowerLawFitter(testdata);
%     a.Fit;
%     actual = [a.EstimatedAsymptote, a.EstimatedRange,...
%         a.EstimatedExposure, a.EstimatedRate];
% 
%     verifyGreaterThan(testCase,actual,[0 0 0 0]) 
%  end