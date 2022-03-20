function tests = test
% Test suite for Metropolis class
tests = functiontests(localfunctions);
end

function testConstructorErrorFree(testCase)

    obj = final.Metropolis(@abs, 1);
    fatalAssertInstanceOf(testCase, obj, ?handle)

end

function setupOnce(testCase)
    testCase.TestData.fcn = @(x)sum(x.^2);
    testCase.TestData.obj = final.Metropolis(testCase.TestData.fcn, [1;1]);    
end

function testDispIsWarningFree(testCase)

    call = @() testCase.TestData.obj.disp();
    verifyWarningFree(testCase, call)

end

function testEvaluateCurrentPointEvaluatesXtoY(testCase)

    testCase.TestData.obj.EvaluateCurrentPoint()
    expected = testCase.TestData.fcn(testCase.TestData.obj.CurrentPointX);
    actual   = testCase.TestData.obj.CurrentPointY;
    verifyEqual(testCase, actual, expected)

end

function testDrawProposalGeneratesNewProposedPointX(testCase)

    testCase.TestData.obj.DrawProposal()
    old = testCase.TestData.obj.ProposedPointX;
    testCase.TestData.obj.DrawProposal()
    new = testCase.TestData.obj.ProposedPointX;
    verifyNotEqual(testCase, old, new)

end

function testEvaluateProposedPointEvaluatesXtoY(testCase)

    testCase.TestData.obj.ProposedPointX = [2;2];
    testCase.TestData.obj.EvaluateProposedPoint()
    expected = testCase.TestData.fcn(testCase.TestData.obj.ProposedPointX);
    actual   = testCase.TestData.obj.ProposedPointY;
    verifyEqual(testCase, actual, expected)

end

function testComputeLogAcceptanceRatio(testCase)

    testCase.TestData.obj.ComputeLogAcceptanceRatio()
    x1 = testCase.TestData.obj.ProposedPointX;
    x2 = testCase.TestData.obj.CurrentPointX;
    expected = testCase.TestData.fcn(x1) - testCase.TestData.fcn(x2);
    actual   = testCase.TestData.obj.LogAcceptanceRatio;
    verifyEqual(testCase, actual, expected)

end

function testMakeProposalCurrentErrorFree(testCase)

    testCase.TestData.obj.MakeProposalCurrent()

end

function testMakeProposalXCurrentX(testCase)

    testCase.TestData.obj.MakeProposalCurrent()
    expected = testCase.TestData.obj.ProposedPointX;
    actual   = testCase.TestData.obj.CurrentPointX;
    verifyEqual(testCase, actual, expected)

end

function testMakeProposalYCurrentY(testCase)

    expected = testCase.TestData.obj.ProposedPointY;
    actual   = testCase.TestData.obj.CurrentPointY;
    verifyEqual(testCase, actual, expected)

end

function testAddToHistoryErrorFree(testCase)

    testCase.TestData.obj.AddToHistory()
    testCase.TestData.obj.AddToHistory()
    testCase.TestData.obj.AddToHistory()

end

function testAddToHistoryX(testCase)

    expected = [2 4];
    actual   = testCase.TestData.obj.XHistory;
    verifySize(testCase, actual, expected)

end

function testAddToHistoryY(testCase)

    expected = [1 4];
    actual   = testCase.TestData.obj.YHistory; 
    verifySize(testCase, actual, expected)

end

function testBurnInIsSettable(testCase)

    expected = 3;
    testCase.TestData.obj.BurnIn = expected;
    verifyEqual(testCase, testCase.TestData.obj.BurnIn, expected)

end

function testCleanHistoryX(testCase)

    expected = testCase.TestData.obj.CurrentPointX;
    [actual, ~, ~] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testCleanHistoryY(testCase)

    expected = testCase.TestData.obj.CurrentPointY;
    [~, actual, ~] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testCleanHistoryI(testCase)

    expected = 4;
    [~, ~, actual] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testBurnInCanBeZero(testCase)

    expected = 0;
    testCase.TestData.obj.BurnIn = expected;
    verifyEqual(testCase, testCase.TestData.obj.BurnIn, expected)

end

function testCleanHistoryXWithoutBurnin(testCase)

    expected = testCase.TestData.obj.XHistory;
    [actual, ~, ~] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testCleanHistoryYWithoutBurnin(testCase)

    expected = testCase.TestData.obj.YHistory;
    [~, actual, ~] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testCleanHistoryIWithoutBurnin(testCase)

    expected = 1:4;
    [~, ~, actual] = testCase.TestData.obj.CleanHistory();
    verifyEqual(testCase, actual, expected)

end

function testDIC(testCase)

    actual = testCase.TestData.obj.DIC;
    [~, Y] = testCase.TestData.obj.CleanHistory();
    expected = mean(-2 * Y) + (var(-2 * Y) / 2);
    verifyEqual(testCase, actual, expected, "AbsTol", eps(1))

end
