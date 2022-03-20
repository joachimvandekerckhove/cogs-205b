% It is a basic test suite of the functions in this JieWanHW package.
% HW4
function tests = test
    tests = functiontests(localfunctions);
end

function testValidLinkCheck(testCase)
    
    badCall = @() getData('http://cidlab.co/files/cogs205b.csv');
    
    verifyError(testCase, badCall, 'MATLAB:UndefinedFunction')
    %verifyError(testCase, badCall, 'getData:urlNotValid')

end

function testNonexistedFileCheck(testCase)
    
    badCall = @() readData('cogs.csv');
    
    verifyError(testCase, badCall, 'MATLAB:load:couldNotReadFile')

end

function testDataSizeCheck(testCase)
    testdat = [1 2 3; 4 5 6; 7 8 9];
    
    badCall = @() JieWanHW.Norm2d.estimate(testdat);
    
    verifyError(testCase, badCall, 'estimate:Over2Variables')

end