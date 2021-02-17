function report(datos)
% This function takes a matrix of size 2 x N 
    % Estimate Mean and Covariance of the variables using deadpool.Norm2d().estimate
    result = deadpool.Norm2d().estimate(datos);

    % Take first 5 observations of each variable to print in the report 
    data_print = datos(:,1:5);

    % Create md File with results
    fid = fopen('deadpool-1.md','w');
        fprintf(fid, '# Report: Mean and Covariance matrix of the input data usin class Norm2d \n');
        fprintf(fid, '\n');
        fprintf(fid, 'Date: %74s  #\n', datestr(now));
        fprintf(fid, '\n');
        fprintf(fid, 'This report was generated using the data matrix (size 2 x N) from the input. The mean vector and ');
        fprintf(fid, 'covariance matrix are obtained from the functions **estimate_mean** and ');
        fprintf(fid, '**estimate_covariance** in the **Norm2d** class respectively.');
        fprintf(fid, '\n');
        fprintf(fid, '### The First 5 rows of the data input are:');
        fprintf(fid, '\n');
        fprintf(fid,'%6.2f %12.8f\r\n', data_print);
        fprintf(fid, '\n');
        fprintf(fid, '\n');
        fprintf(fid, '### The estimated quantities are:');
        fprintf(fid, '\n');
        fprintf(fid, '- Mean( X<sub>1</sub> , X<sub>2</sub> ) = ( %.3f, %.3f )',result.Mean.');
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>1</sub> ) = %.3f \n', result.Covariance(1,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>2</sub>) = %.3f \n', result.Covariance(2,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Covariance( X<sub>1</sub> , X<sub>2</sub> ) = %.3f \n', result.Covariance(1,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Correlation( X<sub>1</sub> , X<sub>2</sub>) = %.3f \n', result.Correlation);
    fclose(fid);

end
