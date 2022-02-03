%print report of the date, size of matrix, mean, and covariance
function markdownOutput = report(variable)
    fileID=fopen('elle_g-1.md', 'w');
    markdownOutput='elle_g-1.md';
    elle_g.Norm2d.estimate(variable);
    Mean(1,1)=mean(variable(:,1));
    Mean(2,1)=mean(variable(:,2));
    Covariance=cov(variable(1, :),variable(2,:));
    matSize=size(variable);
    fprintf(fileID, "Report generated on: %s\n", date);
    fprintf(fileID, "Report generated for your %i by %i matrix\n", matSize(1), matSize(2));
    fprintf(fileID, "Mean of variable 1: %4.4f\nMean of variable 2: %4.4f\n", Mean(1,1), Mean(2,1));
    fprintf(fileID, "Variance of variable 1: %4.4f\nVariance of variable 2: %4.4f\n\t  Covariance: %4.4f", Covariance(1,1), Covariance(2,2), Covariance(1,2));
    fclose(fileID);
    
end

