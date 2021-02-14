function test

    % Test each function and method in this package
    % Should be able to compute a bivariate distro based on test data
    fprintf(1,"\n\n-------\nTesting package contents:\n");
    errorCount = 0;
    % Ensure you can generate a Norm2d object
    try
        A = Norm2d();
    catch
        if ~exist('A','var')
            fprintf("Creation of Norm2d object failed.\n")
        end
        errorCount = errorCount + 1;
    end

    B = A;
    % Ensure you can update mu and sigma on Norm2d
    try
        B.Mean = [5;1]; B.Covariance = 5*eye(2);
    catch
        if B.Mean == A.Mean
            fprintf(1,"Could not update mean of Norm2d object.\n");
            errorCount = errorCount + 1;
        end
        if B.Covariance == A.Covariance
            fprintf(1,"Could not update covariance of Norm2d object.\n");
            errorCount = errorCount + 1;
        end
    end
    
    % Ensure you get the right size data with getData
    testData = getData('http://www.cidlab.com/files/cogs205b.csv');
    if ~exist('testData','var')
        fprintf(1,"Could not successfully fetch data.\n");
        errorCount = errorCount + 1;
    elseif ~isequal(size(testData),[2,10])
        fprintf(1,"Could not download correct data.\n");
        errorCount = errorCount + 1;
    end
    
    % Ensure you can run the whole thing
    % This is the laziest test but it's all I could think of
    try
        main
    catch errorCode
        if exist(errorCode, 'var')
            fprintf("Error on running main code\n");
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
