
good_input = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263 ];
testObservedRt(good_input)
testCount(good_input)
testEstimatedAsymptote(good_input)
testEstimatedRate(good_input)
testEstimatedExposure(good_input)
testEstimatedRange(good_input)
testExpectation(good_input)
testSumOfSquaredError(good_input)
testFit(good_input)
testDisp(good_input)
testTracking1(good_input)
testTracking2(good_input)
testTracking3(good_input)



function testObservedRt(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
actual = obj.ObservedRT;
if actual == good_input
    disp('passed!')
else
    disp('error in handling good input for ObservedRT')
end
end

function testCount(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
expected = length(good_input);
actual = obj.Count;
if actual == expected
    disp('passed!')
else
    disp('error in calculating count!')
end
end

function testEstimatedAsymptote(good_input)

obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj.EstimatedAsymptote
    disp('not fit not detected!')
catch
    disp('passed!')
end
end
function testEstimatedRate(good_input)

obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj.EstimatedRate
    disp('not fit not detected!')
catch
    disp('passed!')
end
end
function testEstimatedRange(good_input)

obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj.EstimatedRange
    disp('not fit not detected!')
catch
    disp('passed!')
end
end
function testEstimatedExposure(good_input)

obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj.EstimatedExposure
    disp('not fit not detected!')
catch
    disp('passed!')
end
end

function testExpectation(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
x = [0 0 0 0 ];
expected = zeros(1, obj.Count);
actual = obj.Expectation(x(1), x(2), x(3), x(4));
if expected == actual
    disp('passed!')
else
    disp('error in Expectation using input:')
    disp(x)
end
end

function testSumOfSquaredError(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
x = randn(1, 4);
observed = obj.SumOfSquaredError(x(1), x(2), x(3), x(4));
if observed < 0
    disp('error in SumOfSquaredError using input:')
    disp(x)
else
    disp('passed!')
end
end

function testFit(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj.Fit()
    disp('passed!')
catch
    disp('error in Fit; input:')
    disp(good_input)
end
end

function testDisp(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
try
    obj
    disp('passed!')
catch
    disp('error in disp; input:')
    disp(good_input)
end
end
function testTracking1(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
if obj.fit
    disp('not fit not detected')
else
    disp('passed!')
end
end

function testTracking2(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
obj.Fit()
try
    obj.Fit()
    disp('not fit not detected')
catch
    disp('passed!')
end
end

function testTracking3(good_input)
obj = hojjatazimi.PowerLawFitter(good_input);
obj.Fit()
obj.ObservedRT = good_input;
try
    obj.Fit()
    disp('passed!')
catch
    disp('error in fitting new data')
end
end

