function report(datos)
% This function takes a matrix of size N x 2 
    % Estimate Mean and Covariance of the variables using deadpool.Norm2d().estimate
    result = deadpool.Norm2d().estimate(datos);

    % Create md File with results
    fid = fopen('deadpool-1.md','w');
        fprintf(fid, '# Report: Mean and Covariance matrix of the vibariate variable in dataFile \n');
        fprintf(fid, '\n')
        fprintf(fid, 'Date: # %74s  #\n', datestr(now));
    fclose(fid);

end
