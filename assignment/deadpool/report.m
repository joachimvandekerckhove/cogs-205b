function report(datos)
% This function takes a matrix of size N x 2 
    % Check Properties of the data matrix
    Check_data(datos);   

    % Estimate Mean and Covariance of the variables using deadpool.Norm2d().estimate
    result = deadpool.Norm2d().estimate(datos)

    % Create md File with results
    fid = ('deadpool-1.md','w')
        
    fclose(fid)

end
