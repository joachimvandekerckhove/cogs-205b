function fprintReport(fhandle, input)
% fprintReport(fhandle, input)
% fhandle is the handle output of fopen
% input is a Norm2d class object
%
% This function writes directly to the file specified,
% and does not generate an output variable.

    fprintf(fhandle,'COGS-205B Data Report\n=======\n\n');
    fprintf(fhandle,'This report provides summary statistics for the dataset found ');
    fprintf(fhandle,'[here](http://www.cidlab.com/files/cogs205b.csv).\n\n');
    fprintf(fhandle,'Report generated on %s\n', datetime());
    
    fprintf(fhandle,'\nSummary Statistics\n-----------\n\n');
    fprintf(fhandle,'* Mean: \n\n\t\t%f, %f\n\n',input.Mean);
    fprintf(fhandle,'* Covariance matrix: \n\n\t\t%f, %f\n\n\t\t%f, %f',input.Covariance);
    
    fprintf(fhandle,'\n\n\n\nEnd of report.');
end
