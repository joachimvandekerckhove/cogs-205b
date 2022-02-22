function tests = PowerLawFitterTest
% PowerLawFitterTest, Test Suite for PowerLawFitter
    tests = functiontests(localfunctions);
end

% Local test* functions as subfunctions
function testFitPositive(testCase)
    testdata = randi(350,1,10);
    testdata = sort(testdata,'descend');
    a = @() kenwat1.PowerLawFitter.Fit(testdata);
    actual = [a.EstimatedAsymptote, a.EstimatedRange,...
        a.EstimatedExposure, a.EstimatedRate];

    verifyGreaterThan(testCase, actual,0)
end

% function testWarningFree(testCase)
%     Mean       = [2;4];
%     Covariance = eye(2);
% 
%     actual = @() kenwat1.Norm2d(Mean,Covariance);
% 
%     verifyWarningFree(testCase,actual)
% end
% 
% function testCorrelation(testCase)
%     X = rand(2,10);
% 
%     newEstimate = kenwat1.Norm2d().estimate(X);
%     expectedValue = newEstimate.Correlation;
% 
%     r = corrcoef(X(1,:),X(2,:));
%     actualValue = r(1,2);
% 
%     verifyEqual(testCase, expectedValue, actualValue, "AbsTol", eps(1))
% 
% end