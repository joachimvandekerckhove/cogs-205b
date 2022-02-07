function tests = myTest
% myTest  Create test suite for Norm2d
    tests = functiontests(localfunctions);
end

% The suite should contain at least three tests, at least one of which users verifyError().

function testMean(testCase)
    sample=[2 2 2; 4 4 4];
    
    elle_g.Norm2d.estimate(sample);
    actVal=sample.Mean;
    expVal=mean(sample,2);
    
    verifyEqual(testCase, actVal, expVal)
end

function testCovariance(testCase)
    sample=[2 2 2; 4 4 4];
   
    elle_g.Norm2d.estimate(sample);
    actVal=sample.Covariance;
    expVal=cov(sample(1, :),sample(2,:));
    
    verifyEqual(testCase, actVal, expVal)
end


function testReadData(testCase)
   data2get='http://cidlab.com/files/cogs205b.csv';
   data2read=elle_g.getData(data2get);
   actVal=elle_g.ReadData(data2read);
   verifyClass(testCase,actVal,"table","Value must be a table.")
end

function testReport(testCase)
    willFail="1 2 3, 1 2 3";
    badCall=elle_g.report(willFail);
    verifyError(testCase, badCall, 'report:InputtedVariableMustBeDouble')
end

