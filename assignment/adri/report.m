% Produce a small report/summary of the Mean and Covariance computed 
function report(data)
    thisReport = adri.Norm2d().estimate(data);

    % Create md File with results
    fid = fopen('adriReport.md','w');
        fprintf(fid, '# Report: adri.Norm2d\n');
        fprintf(fid, '\n');
        fprintf(fid, 'Date: %74s  \n', datestr(now));
        fprintf(fid, '\n');        
        fprintf(fid, '- Mean( X<sub>1</sub> ) = %.3f',thisReport.Mean(1,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>1</sub> ) = %.3f \n', thisReport.Covariance(1,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Mean( X<sub>2</sub> ) = %.3f',thisReport.Mean(2,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>2</sub>) = %.3f \n', thisReport.Covariance(2,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Covariance( X<sub>1</sub> , X<sub>2</sub> ) = %.3f \n', thisReport.Covariance(1,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Correlation( X<sub>1</sub> , X<sub>2</sub>) = %.3f \n', thisReport.Correlation);
    fclose(fid);

end