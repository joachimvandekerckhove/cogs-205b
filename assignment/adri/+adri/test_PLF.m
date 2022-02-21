% Testing some of the functions included in Norm2d
function test_PLF(pseudonym)

    % We start printing a few lines of text to indicate that the test has
    % been initiated.
    line = repmat('-', 1, 73);
    fprintf('#%s#\n', line);
    fprintf('# %70s  #\n', datestr(now))    
    fprintf('#%-73s#\n', sprintf('  My very own test suite  '))
    fprintf('#%s#\n', line); 

    %We evaluate whether the pseudonym.Norm2d() class can be found.
    try
        this = [];
        eval(sprintf('this = %s.Norm2d();', pseudonym))
    catch me
        fprintf('------> ERROOOOOOR: %s.Norm2d class does not exist.\n', pseudonym);
        throw(me)
    end
    throwAsCaller = @(x)warning(x.message);
    
    %Test the defensive coding in getData
    try
        badURL = "www.adriland.com"
        pseudonym.getData(badURL)
        errorDetect = false;
    catch me
        errorDetect = true;
    end
    ErrorWasFound(errorDetect,'getData requires a valid URL')

    % Testing out adri.Norm2d.estimate %%%%%%%%%%%%%%%%%%%%%
    % Some random data
    testData = [4,3;2,7;4,1;5,5;9,6];
    % Generate "golden standard" estimates from Matlab's functions
    testMean = mean(testData,1)';
    testCov = cov(testData);
    testPres = inv(testCov);    
    testCorr = corr(testData);
    testCorr = testCorr(1,2);
    % Generate estimates from my package
    myEstimates = this().estimate(testData);
    % Compare Matlab estimates against my estimates
    Compare(testMean, myEstimates.Mean, 'Mean vector')
    Compare(testCov, myEstimates.Covariance, 'Covariance matrix')
    Compare(testPres, myEstimates.Precision, 'Presicion matrix')
    Compare(testCorr, myEstimates.Correlation, 'Correlation X1 and X2')

    fprintf('#%s#\n', line);
    fprintf('#%-73s#\n', sprintf(' TEST COMPLETED:  ', class(this)))
    fprintf('#%-73s#\n', sprintf(' Yayyy! Estimates are correct "%s"  ', class(this)))
    fprintf('#%s#\n', line);

% Define comparison function
    function Compare(a, b, testing)
        if all(abs(a-b) < 1e-10)
            success(testing)
        else
            fprintf('#%s#\n', line);
            fprintf('-----> ERROOOOOR || Test failed for: %s\n', testing)            
            throwAsCaller(failure(testing))
        end
    end

% Success function
    function success(testing)
        fprintf('# %-63s ', sprintf(' %s', testing));
        fprintf('Ok #\n')
    end

% Failure function
    function me = failure(testing)        
        me = ...
            MException( ....
                'adri:testSuite', ...
                sprintf('TestSuite failed when testing for "%s"', testing));
    end

% Function for whenever an error is found
    function ErrorWasFound(x,testing)
        if x
            success(testing)
        else
            fprint('------> ERROR')
            fprint('Failure to reject faulty input')
            fprint('Following condition violated: %s\n',testing)
            throwAsCaller(failure(testing))
        end
    end
end