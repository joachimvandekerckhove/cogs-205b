function tests = Norm2dTestsuite
% Norm2dTestsuite runs a test for Norm2d functions

tests = functiontests(localfunctions);
end
%% Tests pdf function output size
function testpdf(testCase)
    mean=[3;4];
    covariance=eye(2);
    value=[2 3 ; 5 6];
    expected=size(mvnpdf(value,mean',covariance));
    actual=size(marjan.Norm2d(mean,covariance).pdf(value));
    verifySize(testCase,expected,actual)
end

%% Tests rnd function to verify that it generates numbers with the given mean
function testrnd(testCase) 
count=1000;
Mean=[3;4];
covariance=eye(2);
rndNum=marjan.Norm2d(Mean,covariance).rnd(count);
expected=mean(rndNum')'; %#ok<UDIM> 
actual=Mean;
verifyEqual(testCase,expected,actual,"AbsTol",.1)
end
%% Tests  estimate function and compares errors
function testEstimate(testCase)
    X=[2 3 ; 4 5 ; 7 8 ];
    errorIdd='Norm2d:estimate:wrongSize'; 
    %errorMsg="The data should be 2*N matrix";
    badCall=@() marjan.Norm2d.estimate(X);
    verifyError(testCase, badCall, errorIdd)
end

 
