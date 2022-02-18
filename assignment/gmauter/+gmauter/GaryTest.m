function tests = GaryTest
% NORMALTEST  Create test suite for Normal class
    tests = functiontests(localfunctions);

end


% 3 more tests

function testEstimate(testCase)

% tests if estimate() input X is a 2xN matrix

wrongMatrix = zeros(1, 3);
wrongInput = @() gmauter.Norm2d().estimate(wrongMatrix);

verifyError(testCase,wrongInput,'MATLAB:validation:IncompatibleSize')

end



function testGetData(testCase)


url = 'http://cidlab.com/files/cogs205b.csv';
expected = fullfile(pwd, 'cogs205b.csv');
actual = gmauter.getData(url);
verifyEqual(testCase, expected, actual, "getData:incorrectInputURL")

end


function testReadData(testCase)

file_name = 'cogs205b.csv';
expected = [10 2];
actual = gmauter.readData('cogs205b.csv');

verifySize(testCase, expected, actual, "readData:InputFileSizeInvalid")


end
