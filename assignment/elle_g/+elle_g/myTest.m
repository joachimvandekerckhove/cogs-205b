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

function testSize(testCase)
    %% MIGHT BE A GOOD OPP TO USE THE VERIFY ERROR
end

function testGetData(testCase)
    wontWork="http://mynewpuppyisnamedlady.com/";
    elle_g.getData(wontWork)
    %% try throw error here?
end

function testGetData(testCase)
   data2get='http://cidlab.com/files/cogs205b.csv';
   actVal=elle_g.getData(data2get);
   %% FIGURE OUT WHICH VERIFIER TO PUT HERE
   
end

function testReadData(testCase)
   data2read=%%ADD SOMETHING HERE FOR PROPER INPUT
   actVal=elle_g.ReadData(data2read);
   %% FIGURE OUT WHICH VERIFIER TO PUT HERE (HOW TO VERIFY
   %% IT IS A TABLE?)
   
end

function testReport(testCase)
end

function testMain()
end

function testContents()
end

function 