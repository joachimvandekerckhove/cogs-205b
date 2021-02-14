function report(myDistro)
% This just handles the IO for the reporting process
% Create an output file
filename = 'cable-1.md';
file = fopen(filename,'wt');
% % Generate a report in MARKDOWN format
% options.codeToEvaluate = sprintf('Mean = [%f %f]; Covariance = [%f %f;%f %f];',myDistro.Mean, myDistro.Covariance);
% options.evalCode = true;
% filename2 = publish('generateReport.m',options);
% % Save the report file
% fprintf(file,filename2);

% % Generate report in MARKDOWN using fprintf
fprintReport(file,myDistro);
fclose(file);

end
