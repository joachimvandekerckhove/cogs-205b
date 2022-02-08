function tests = myTest
% myTest  Create test suite for Norm2d
    tests = functiontests(localfunctions);
end

function testMean(testCase)
    sample=[4 25 1999; 2 4 2022];
    
    s=elle_g.Norm2d.estimate(sample);
    actVal=s.Mean;
    expVal=mean(sample,2);
    
    verifyEqual(testCase, actVal, expVal)
end

function testCovariance(testCase)
    sample=[4 25 1999; 2 4 2022];
   
    s=elle_g.Norm2d.estimate(sample);
    actVal=s.Covariance;
    expVal=cov(sample(1, :),sample(2,:));
    
    verifyEqual(testCase, actVal, expVal)
end


function testGetData(testCase)
   data2get='http://cidlab.com/files/cogs205b.csv';
   actVal=elle_g.getData(data2get);
   verifyNotEmpty(testCase,actVal, "inputted URL downloaded blank data. check url.")
end


function testReadData(testCase)
   data2get='http://cidlab.com/files/cogs205b.csv';
   d=elle_g.getData(data2get);
   actVal=elle_g.readData(d);
   verifyNotEmpty(testCase,actVal, "local file outputted blank variable. check local file.")
end

function testReport(testCase)
    willFail="1 2 3, 1 2 3";
    badCall= @() elle_g.report(willFail);
    verifyError(testCase, badCall, 'report:InputtedVariableMustBeDouble')
end

function testMain(testCase)
    
end

function testContents(testCase)
end

