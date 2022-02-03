function rep = report(data)

    % REPORT    Prints a report to file in markdown format
    rep = fopen('+lemontgomery2/lemontgomery2-1.md', 'wt');
  
    % general formatting features
    fprintf(rep, '%% Mean, Covariance, and Correlation\n');
    fprintf(rep, '%% Calculated on %s\n', datestr(now));
    fprintf(rep, '%% Results:\n');
    b = sprintf('*');  
    k = sprintf('[');
    
    % adds mean, covariance, and correlation to report
    %f = ' %s  %-20s = %8.4s\n\n';
    f = '     %s %s = %s %g ; %g ]\n';
    h = '     %s %s = %s %g %g ; %g %g ]\n';
    j = '     %s %s = %g \n';
    fprintf(rep, f, b, 'Mean', k, ...
            lemontgomery2.Norm2d.estimate(data).Mean);
    fprintf(rep, h, b, 'Covariance', k, ...
            lemontgomery2.Norm2d.estimate(data).Covariance);
    fprintf(rep, j, b, 'Correlation', ...
            lemontgomery2.Norm2d.estimate(data).Correlation);
    
    % closes file
    fclose(rep);
            
end