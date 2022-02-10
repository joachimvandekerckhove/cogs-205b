function report(bivarData)
% Expects: A MATLAB variable containing bivariate (X, Y) data. Promises: Produces a .md file that presents the mean and covariance of the data.
    fileID = fopen('isaacmenchaca-1.md','w');
    
        fprintf(fileID,'## Automated Generated Report: %74s\n', datestr(now));
        fprintf(fileID, 'Bivariate normal likelihood equivalence class\n');
        fprintf(fileID,'# * Data:\n');
        fprintf(fileID,'%6.2f %12.8f\n', bivarData);
        
        
        norm2dObj = isaacmenchaca.Norm2d().estimate(bivarData);
        
        
        fprintf(fileID, '# * Mean of variables (2xN):\n');
        fprintf(fileID,'%6.2f %12.8f\n', norm2dObj.Mean);
        fprintf(fileID, '# * Covariance of variables (2x2):\n');
        fprintf(fileID,'%6.2f %12.8f\n', norm2dObj.Covariance);
    

    fclose(fileID);
    
    
end


