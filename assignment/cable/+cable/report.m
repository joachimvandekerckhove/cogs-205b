function report(myDistro)
% report(myNorm2d)
% This just handles the IO for generating a report; fprintReport does the heavy lifting.
% Takes a Norm2d class object as input
% Ultimately generates a markdown file cable-1.md listing the mean and
% covariance matrix of myNorm2d.

    % Create an output file
    filename = 'cable-1.md';
    file = fopen(filename,'wt');

    % % Generate report in MARKDOWN using fprintf
    fprintReport(file,myDistro);
    fclose(file);

end
