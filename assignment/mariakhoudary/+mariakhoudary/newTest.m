function tests = newTest
% NEWTEST uses MATLAB unit testing to run a testsuite of the mariakhoudary
% package

tests = functiontests(localfunctions);
end

%% Test that estimate() returns a Norm2d object
function testEstimateOutput(testCase)
    % FIXED: .estimate needs an input
    actualObj = mariakhoudary.Norm2d().estimate(randn(2,4));
    expectedObj = 'mariakhoudary.Norm2d';

    verifyClass(testCase, actualObj, expectedObj)
end


%% Test estimate()'s mean function
function testEstimateMean(testCase)
    X = [1:4; 5:8];
    obj = mariakhoudary.Norm2d.estimate(X);
    correctMean1 = mean(X(1,:));
    correctMean2 = mean(X(2,:));
    expectedMean = vertcat(correctMean1, correctMean2);
    actualMean = obj.Mean;

    verifyEqual(testCase, actualMean, expectedMean)
end

%% Test estimate()'s input validation
function testEstimateError(testCase)
    Mean = [1:3; 4:6; 7:9];

    badCall = @() mariakhoudary.Norm2d.estimate(Mean);

    verifyError(testCase, badCall, 'Input must be 2xN')
end




