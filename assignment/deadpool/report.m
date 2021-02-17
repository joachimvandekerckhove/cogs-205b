function report(datos)
%  REPORT  Takes a matrix of size 2 x N.
%    
% This function takes a matrix of size 2 x N and generates a report of the 
% mean and covariance of the data given as input.

    % Estimate Mean and Covariance of the variables using deadpool.Norm2d().estimate
    result = deadpool.Norm2d().estimate(datos);

    % Get sample size by size of matrix
    n_sample = size(result)
    n_sample = n_sample(2);

    % Create md File with results
    fid = fopen('deadpool-1.md','w');
        fprintf(fid, '# Report: Mean and Covariance matrix of the input data using class Norm2d \n');
        fprintf(fid, '\n');
        fprintf(fid, 'Date: %74s  \n', datestr(now));
        fprintf(fid, '\n');
        fprintf(fid, 'This report was generated using the data matrix (size 2 x N) from the input. The mean vector and ');
        fprintf(fid, 'covariance matrix are obtained from the functions **estimate_mean** and ');
        fprintf(fid, '**estimate_covariance** in the **Norm2d** class respectively.Results are based on a sample of size N = %.15g',n_sample);
        fprintf(fid, '\n');
        fprintf(fid, '### The estimated quantities are:');
        fprintf(fid, '\n');
        fprintf(fid, '- Mean( X<sub>1</sub> ) = %.3f',result.Mean(1,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>1</sub> ) = %.3f \n', result.Covariance(1,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Mean( X<sub>2</sub> ) = %.3f',result.Mean(2,1));
        fprintf(fid, '\n');
        fprintf(fid, '- Variance( X<sub>2</sub>) = %.3f \n', result.Covariance(2,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Covariance( X<sub>1</sub> , X<sub>2</sub> ) = %.3f \n', result.Covariance(1,2));
        fprintf(fid, '\n');
        fprintf(fid, '- Correlation( X<sub>1</sub> , X<sub>2</sub>) = %.3f \n', result.Correlation);
    fclose(fid);

end
