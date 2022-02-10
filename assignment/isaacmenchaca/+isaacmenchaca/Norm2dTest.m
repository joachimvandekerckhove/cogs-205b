function tests = Norm2dTest
 % create test suite for Norm2dTest class
     tests = functiontests(localfunctions);
end
 

%% Test Norm2d() class

% Local test* functions as subfunctions

function testPositiveDefinite(testCase)
    mu = [1 ; 1];
    sigma = [1 2; 1 3]; % not positive definite
    badCall = @() isaacmenchaca.Norm2d(mu, sigma);    
    verifyError(testCase, badCall, 'Convariance:NotSymmetricPositiveDefinite')
end

function testMeanDimensions(testCase)
    mu = [1 ; 1 ; 1]; % wrong dimension
    sigma = [1 0; 0 1];
    badCall = @() isaacmenchaca.Norm2d(mu, sigma); 
    verifyError(testCase, badCall, 'MATLAB:validation:IncompatibleSize')
end 


function testCovarianceDimensions(testCase)
    mu = [1 ; 1]; % wrong dimension
    sigma = [1 1 1 1; 2 2 2 2; 1 1 1 1];
    badCall = @() isaacmenchaca.Norm2d(mu, sigma); 
    
    verifyError(testCase, badCall, 'MATLAB:validation:IncompatibleSize')
end 


function testEstimate(testCase)
    X = [1 1 1 1; 2 2 2 2; 1 1 1 1]; % fails for not having N x 2 Dims
    badCall = @() isaacmenchaca.Norm2d().estimate(X);
    verifyError(testCase, badCall, 'MATLAB:validation:IncompatibleSize');
end


function testPDF(testCase)
     % passing known working dataset
    X = [5.4694, -3.3563, 1.1302, 3.2101, 5.4024, 7.1768, 1.3437, -4.9664, -1.9692, -3.2463;
        10.4018, -1.4624, 3.9923, 0.2303, 4.5544, -2.0594, -4.6091, -4.6895, 2.9528, 0.2905];
    
    Norm2dObj = isaacmenchaca.Norm2d().estimate(X);
    expectedVal = mvnpdf(X', Norm2dObj.Mean', Norm2dObj.Covariance)';
    actualVal = Norm2dObj.pdf(X);
    verifyEqual(testCase, expectedVal, actualVal, "AbsTol", 1e-10);
end

function testCDF(testCase)
     % passing known working dataset
    X = [5.4694, -3.3563, 1.1302, 3.2101, 5.4024, 7.1768, 1.3437, -4.9664, -1.9692, -3.2463;
        10.4018, -1.4624, 3.9923, 0.2303, 4.5544, -2.0594, -4.6091, -4.6895, 2.9528, 0.2905];
    
    Norm2dObj = isaacmenchaca.Norm2d().estimate(X);
    expectedVal = mvncdf(X', Norm2dObj.Mean', Norm2dObj.Covariance)';
    actualVal = Norm2dObj.cdf(X);
    verifyEqual(testCase, expectedVal, actualVal);
end


%% test other functions


function testGetData(testCase)
    url = "asbjfivubweirf.com/files/data.csv"; % a url that shouldnt work.
    badCall = @() isaacmenchaca.getData(url);
    verifyError(testCase, badCall, 'URL:NotValidURLforDataRetrieval')
end


function testReadData(testCase)
    X = [5.4694, -3.3563, 1.1302, 3.2101, 5.4024, 7.1768, 1.3437, -4.9664, -1.9692, -3.2463;
        10.4018, -1.4624, 3.9923, 0.2303, 4.5544, -2.0594, -4.6091, -4.6895, 2.9528, 0.2905];
    expectedVal = isaacmenchaca.Norm2d().estimate(X);
    
    
    fileName = isaacmenchaca.getData("http://cidlab.com/files/cogs205b.csv");
    X2 = isaacmenchaca.readData(fileName);
    actualVal = isaacmenchaca.Norm2d().estimate(X2);
    
    verifyEqual(testCase, expectedVal, actualVal);
    
end


