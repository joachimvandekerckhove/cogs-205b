% Create test suite for adri.PowerLawFitter
function tests = PowerLawFitterTest
    tests = functiontests(localfunctions);
end

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR EACH PROPERTY :::::::::::::::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that Observed RT data can't contain negative numbers
function testNegativeObservedRT(testCase)
    badRT = [380 370 360 350 -1];
    badCall = @() adri.PowerLawFitter(badRT);
    verifyError(testCase, badCall, 'MATLAB:validators:mustBePositive')
end
% Check that EstimatedAsymptote is empty before myFit is run
function testEmptyAsymptote(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    verifyEmpty(testCase,f.EstimatedAsymptote)
end
% Check that EstimatedRange is empty before myFit is run
function testEmptyRange(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    verifyEmpty(testCase,f.EstimatedRange)
end
% Check that EstimatedRate is empty before myFit is run
function testEmptyRate(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    verifyEmpty(testCase,f.EstimatedRate)
end
% Check that EstimatedExposure is empty before myFit is run
function testEmptyExposure(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    verifyEmpty(testCase,f.EstimatedExposure)    
end
% Check that Count property corresponds to the No. of observations
function testCount(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    actualSize = size(data,2);    
    verifyEqual(testCase, f.Count, actualSize, "AbsTol", eps(1))
end


%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE EXPECTED VALUE FUNCTION::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that an error is thrown if no parameter values are specified
function testNoinputExpRT(testCase)
    data = adri.toyRTdata;
    badcall   = @() adri.PowerLawFitter(data).expectedRT;      
    verifyError(testCase, badcall, 'MATLAB:ExpRTrequiresParameterValues')    
end
% Check that it retrieves as many expected RTs as data points in data
function testSizeExpRT(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    expRT = f.expectedRT(100,100,1,1);
    expRTsize = size(expRT,2);    
    dataSize = size(data,2);
    verifyEqual(testCase, expRTsize, dataSize, "AbsTol", eps(1))
end
% Check that all the values retrieved are positive
function testPositiveExpRT(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    expRT = f.expectedRT(100,100,1,1);
    verifyGreaterThanOrEqual(testCase,expRT,0)
end


%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE SSE FUNCTION:::::::::::::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that an error is thrown if no parameter values are specified
function testNoinputSSE(testCase)
    data = adri.toyRTdata;
    badcall   = @() adri.PowerLawFitter(data).sse;      
    verifyError(testCase, badcall, 'MATLAB:SSErequiresParameterValues')    
end
% Check that it returns a single number
function testScalarSSE(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    SSE  = f.sse(100,100,1,1);      
    import matlab.unittest.constraints.IsScalar    
    verifyThat(testCase,SSE,IsScalar)    
end

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE FIT FUNCTION:::::::::::::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that it runs without any input
function testNoinputFit(testCase)
    data = adri.toyRTdata;    
    fit = @() adri.PowerLawFitter(data).myFit; 
    verifyWarningFree(testCase, fit)    
end
% Check that EstimatedAsymptote is updated after myFit (default values)
function testFitAsymptote(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    verifyNotEmpty(testCase,f.EstimatedAsymptote)
end
% Check that EstimatedRange is updated after myFit (default values)
function testFitRange(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    verifyNotEmpty(testCase,f.EstimatedRange)
end
% Check that EstimatedRate is updated after myFit (default values)
function testFitRate(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    verifyNotEmpty(testCase,f.EstimatedRate)
end
% Check that EstimatedExposure is updated after myFit (default values)
function testFitExposure(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    verifyNotEmpty(testCase,f.EstimatedExposure)
end
% Check that the function runs if initial values are specified
function testInputFit(testCase)
    data = adri.toyRTdata;    
    fit = @() adri.PowerLawFitter(data).myFit(100,100,1,1); 
    verifyWarningFree(testCase, fit)    
end
% Check that the optimization halts if user sets invalid initial values.
function testInvalidInputFit(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit(-50,-50,-50,-50);
    verifyEmpty(testCase,f.EstimatedAsymptote)
end

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE RESET PROPERTIES FUNCTION::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that the Count property is updated whenever new data is input
function testCountUpdate(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    count1 = f.Count;
    f.ObservedRT = [1 2 3 4 5];
    verifyNotEqual(testCase,f.Count,count1)
end
% Check that the EstimatedAsymptote is reset when new data is input
function testAsymptoteReset(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    f.ObservedRT = [];
    verifyEmpty(testCase,f.EstimatedAsymptote)
end
% Check that the EstimatedRange is reset when new data is input
function testRangeReset(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    f.ObservedRT = [];
    verifyEmpty(testCase,f.EstimatedRange)
end
% Check that the EstimatedRate is reset when new data is input
function testRangeRate(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    f.ObservedRT = [];
    verifyEmpty(testCase,f.EstimatedRate)
end
% Check that the EstimatedExposure is reset when new data is input
function testExposureReset(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    f.myFit;
    f.ObservedRT = [];
    verifyEmpty(testCase,f.EstimatedExposure)
end

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE Check-initial-values FUNCTION::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that pseudoflag = 0 when all initial values are VALID
function testInitialValuesValid(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    pseudoflag = f.checkValues(100,100,1,1);
    verifyEqual(testCase, pseudoflag, 0, "AbsTol", eps(1))
end
% Check that pseudoflag = 1 when ALL initial values are INVALID
function testALLInitialValuesInValid(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    pseudoflag = f.checkValues(-100,-100,-1,-1);
    verifyEqual(testCase, pseudoflag, 1, "AbsTol", eps(1))
end
% Check that pseudoflag = 0 when SOME initial values are INVALID
function testSOMEInitialValuesInValid(testCase)
    data = adri.toyRTdata;
    f = adri.PowerLawFitter(data);
    pseudoflag = f.checkValues(-100,-100,1,1);
    verifyEqual(testCase, pseudoflag, 1, "AbsTol", eps(1))
end

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% TESTS FOR THE DISP FUNCTION::::::::::::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Check that the DISP function doesn't throw any errors
function testDisp(testCase)
    data = adri.toyRTdata;    
    Disp = @() adri.PowerLawFitter(data).disp; 
    verifyWarningFree(testCase, Disp)    
end