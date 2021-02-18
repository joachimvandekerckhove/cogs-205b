function test
% test
% Test suite that validates each function in this package.
% Suppresses errors, but tells you which functions are to blame.

    % Should be able to compute a bivariate distro based on test data
    fprintf(1,"\n\n-------\nTesting package contents:\n");
    errorCount = 0;
    % Ensure you can generate a Norm2d object
    try
        A = Norm2d();
    catch
        if ~exist('A','var')
            fprintf("\tCreation of Norm2d object failed.\n")
            errorCount = errorCount + 1;
        end
        
    end

    B = A;
    % Ensure you can update mu and sigma on Norm2d
    try
        B.Mean = [5;1]; B.Covariance = 5*eye(2);
    catch
        if isequal(B.Mean, A.Mean)
            fprintf(1,"\tCould not update mean of Norm2d object.\n");
            errorCount = errorCount + 1;
        end
        if isequal(B.Covariance, A.Covariance)
            fprintf(1,"\tCould not update covariance of Norm2d object.\n");
            errorCount = errorCount + 1;
        end
    end
    
    % Ensure you get the right size data with getData
    testData = getData('http://www.cidlab.com/files/cogs205b.csv');
    if ~exist('testData','var')
        fprintf(1,"\tCould not successfully fetch data.\n");
        errorCount = errorCount + 1;
    elseif ~isequal(size(testData),[2,10])
        fprintf(1,"\tCould not download correct data.\n");
        errorCount = errorCount + 1;
    end
    
    % Ensure the estimate function works with the above test data
    try
        C = A.estimate(testData);
    catch
        if isequal(C.Mean, A.Mean) && isequal(C.Covariance, A.Covariance)
            fprintf("\tCould not estimate new distribution from test data.\n");
            errorCount = errorCount + 1;
        end
    end
    
    % Ensure you can run the main code, which basically does all the above.
    % If this errors but none of the above do, the problem is with main.
    try
        main
    catch errorCode
        if exist(errorCode, 'var')
            fprintf("\tError on running main code.\n");
            errorCount = errorCount + 1;
        end
    end
    
    % Final accounting
    if errorCount == 0
        fprintf(1,"Completed test with no errors detected.\n\n\n");
    else
        fprintf(1,'Test returned %i errors.\n\n\n',errorCount);
    end
end
