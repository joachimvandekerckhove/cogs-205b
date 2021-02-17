function report(datamat)
%REPORT Generate a markdown file with basic info on the input data
%   Input: datamat - 2xN matrix that contains data to be estimated 
    dataObj = groot.estimate(datamat);
    
    outfile = fopen('dataReport.md', 'w');
    fprintf(outfile, '## Norm2D estimate from %.0fx%.0f samples\n',...
        size(datamat,1), size(datamat,2));
    fprintf(outfile, '- Mean = [%.2f %.2f]\n', dataObj.Mean(1), dataObj.Mean(2));
    fprintf(outfile, '- Covariance = $\\begin{bmatrix}\n%.2f &%.2f\\\\%.2f &%.2f \\end{matrix}$\n',...
        dataObj.Covariance(1,1), dataObj.Covariance(1,2), ...
        dataObj.Covariance(2,1), dataObj.Covariance(2,2));
    fclose(outfile);
end

