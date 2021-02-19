function test ()
% Run a basic test suite of the functions in the package

% Expects: No input.
% Promises: Runs a basic test suite of the functions in the package 
% making sure they all work without errors as intended (or with errors if that is
% intended) and give the expected output.



%% Report
% Start printing a little report to screen

% make a long line
dashline = repmat('-', 1, 77);

% print a line
fprintf('#%s#\n', dashline);

% print time and date
fprintf('# %74s  #\n', datestr(now))

% print report title
fprintf('#%-77s#\n', sprintf('Test suite of the functions in the package'))

% print a line
fprintf('#%s#\n', dashline);

%%

try 
    obj=Adam.Norm2d();
    fprintf('Class object successfully initialized');
catch
    fprintf('Error creating the class object');
end


try
    Adam.Norm2d().estimate(X);
    fprinf('Mean and Covariance of the data was set')
catch
    fprintf('Setting Mean and Covariance failed')
end


try 
    url='http://cidlab.com/files/cogs205b.csv';
    [fileName]=getData(url);
    fprinf('Data file in the directory created')
catch
    fprinf('Not able to create the data file in the directory')
end

try 
    [X] = readData(fileName);
    fprinf('Output the variable successful')
catch
    fprinf('Output the variable failed')
end

try 
    report(obj, X);
    fprintf('Report generated')
catch
    fprintf('Error generating the report')
end

try 
    main();
    fprintf('Automated work flow executed')
catch
    fprintf('Work flow failed')
end

try 
    help Adam
    fprintf('Contents generated')
catch
    fprintf('failed to generate Contents.m')
end



end