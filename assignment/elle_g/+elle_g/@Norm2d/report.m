%print report of the date, size of matrix, mean, and covariance
function markdownOutput = report(variable)
    fileID=fopen('elle_g-1.md', 'w');
    markdownOutput='elle_g-1.md';
    mean=elle_g.Norm2d(obj, Mean);
    covariance=elle_g.Norm2d(obj, Covariance);
    matSize=size(variable);
    fprintf(fileID, "Report generated on: %s", date);
    fprintf(fileID, "Report generated for your %i by %i matrix", matSize(1), matSize(2));
    fprintf(fileID, "Mean of variable 1: %4.4f\n Mean of variable 2: %4.4f", mean(1,1), mean(2,1));
    fprintf(fileID, "Variance of variable 1: %4.4f\nVariance of variable 2: %4.4f\n\t  Covariance: %4.4f", covariance(1,1), covariance(2,2), covariance(1,2));
    fclosef(fileID);
    
end

