% Testing some of the functions included in Norm2d
function test(pseudonym)
    % Output on screen
    line = repmat('-', 1, 77);

    fprintf('#%s#\n', line);
    fprintf('# %74s  #\n', datestr(now))
    fprintf('#%-77s#\n', sprintf('  My very own test suite for "%s"  ', class(this)))
    fprintf('#%s#\n', line); 

% Testing out adri.Norm2d.estimate
    % Some random data
    testData = [4,3;2,7;4,1;5,5;9,6];
    % Generate "golden standard" estimates from Matlab's functions
    testMean = mean(testData,1);
    testCov = cov(testData);
    testPres = inv(testCov);    
    testCorr = corr(testData);
    testCorr = testCorr(1,2);
    % Generate estimates from my package
    myEstimates = this().estimate(testData);
    % Compare Matlab estimates against my estimates
    Compare(testMean, myEstimates.Mean, 'Testing means computed')
    Compare(testCov, myEstimates.Covariance, 'Testing covariance matrix')
    Compare(testPres, myEstimates.Precision, 'Testing Presicion matrix')
    Compare(testCorr, myEstimates.Correlation, 'Testing Correlation')

% Define comparison function
    function Compare(a, b, condition)
        if all(abs(a-b) < 1e-10)
            success(condition)
        else
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)            
            throwAsCaller(failure(condition))
        end
    end

% Success message
    function success(condition)
        fprintf('# %-67s ', sprintf(' %s', condition));        
    end

end