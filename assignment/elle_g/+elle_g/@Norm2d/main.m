%report file for data from url
function reportFile = main()
    % report file named pseudonym-1.md that contains the mean and covariance 
    % of the bivariate data that are contained in http://cidlab.com/files/cogs205b.csv at the time it was run.
    gd=elle_g.Norm2d(run, getData, 'http://cidlab.com/files/cogs205b.csv');
    rd=elle_g.Norm2d(run, readData, gd);
    reportFile=elle_g.Norm2d(run, report, rd);
end
 
