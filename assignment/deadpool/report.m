function report(datos)
% This function takes a matrix of size N x 2 
    % Estimate Mean and Covariance of the variables using deadpool.Norm2d().estimate
    result = deadpool.Norm2d().estimate(datos);

    % Create md File with results
    fid = fopen('deadpool-1.md','w');
        fprintf(fid, '# Report: Mean and Covariance matrix of the input data usin class Norm2d \n');
        fprintf(fid, '\n');
        fprintf(fid, 'Date: %74s  #\n', datestr(now));
        fprintf(fid, '\n');
        fprintf(fid, 'This report was generated using the data matrix from the input. The mean vector and ');
        fprintf(fid, 'covariance matrix are obtained from the functions **estimate_mean** and ');
        fprintf(fid, '**estimate_covariance** in the **Norm2d** class respectively.');
        fprintf(fid, '\n');
        fprintf(fid, '### The estimated quantities are:');
        fprintf(fid, '\n');
        fprintf(fid, '- mean = ( %f, %f )',result.Mean.');
        fprintf(fid, '- Covariance =  %f, %f \n',result.Covariance);
    fclose(fid);

end