function test() 
% Expects: No input. Promise: Runs a test suite that verifies the functionality of the functions in the package.
  %% Report
    % Start printing a little report to screen
   
    
    % make a long line
    dashline = repmat('-', 1, 77);

    % print a line
    fprintf('#%s#\n', dashline);

    % print time and date
    fprintf('# %74s  #\n', datestr(now))
    

%% Test Norm2d().estimate() static method.


    % passing known working dataset
    z = [5.4694, -3.3563, 1.1302, 3.2101, 5.4024, 7.1768, 1.3437, -4.9664, -1.9692, -3.2463;
        10.4018, -1.4624, 3.9923, 0.2303, 4.5544, -2.0594, -4.6091, -4.6895, 2.9528, 0.2905];

%     z = [1 1 1 1; 2 2 2 2]; % fails for positive-definite
%     z = [1 1 1 1; 2 2 2 2; 1 1 1 1]; % fails for not having N x 2 Dims
    try 
        Norm2dObj = isaacmenchaca.Norm2d().estimate(z);
        errorThrown = false; % it passes
    catch
        errorThrown = true; % it fails
    end
    assertErrorThrown(errorThrown, 'X contains size of 2xN (dimensions) and is positive-definite');

 %% Test getData() function.
    url = "http://cidlab.com/files/cogs205b.csv"; % a known url that works
    
%     url = "asbjfivubweirf.com/files/data.csv"; % a url that shouldnt work.
 
    try
        downloadedFilePath = isaacmenchaca.getData(url);
        errorThrown = false;
    catch
        errorThrown = true;
    end
    assertErrorThrown(errorThrown, 'URL exists/ appropriate for data retrieval.');
    
 %% Test readData() function.
     fileName = "cogs205b.csv"; % a known file that works
%      fileName = "cogs205b2.csv"; % a file with only one variable of interest.
%      fileName = "cogs205b3.csv"; % a filename that doesnt exist


    try
        X = isaacmenchaca.readData(fileName);
        Norm2dObj = isaacmenchaca.Norm2d().estimate(X);
        errorThrown = false;
    catch
        errorThrown = true;
    end
    assertErrorThrown(errorThrown, 'The file exists/ is not appropriate for data retrieval.');
    

    
%% Subfunctions

    % Assert that an error was thrown on a call
    function assertErrorThrown(a,condition)
        if a
            
            fprintf('#%s#\n', dashline);
            fprintf('!  Test failed: %s\n', condition)
            disp('!  I expected an error to be thrown')
            throwAsCaller(failure(condition))
            
        else
            success(condition)
        end
    end

    % Success message
    function success(condition)
        fprintf('# %-67s ', sprintf(' %s', condition));
        fprintf('passed  #\n');
    end

    % Failure message
    function me = failure(condition)
        fprintf('# %-67s FAILED  #\n', sprintf(' %s', condition));
        fprintf('#%s#\n', dashline);
        me = ...
            MException( ....
                'magneto:testSuite', ...
                sprintf('TESTSUITE failed for condition "%s"', condition));
    end


end

