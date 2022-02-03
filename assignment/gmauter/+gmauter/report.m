function report(data)

% creates markdown file which displays mean and covariance

fid = fopen('gmauter.md', 'w')
fprintf(fid, 'Data from cogs205b.csv\n')
fprintf(fid, '%s\n\n', datetime('now'))

Mean = gmauter.Norm2d().estimate(X).Mean
Covariance = gmauter.Norm2d().estimate(X).Mean


fprintf(fid, '- Mean: ')
fprintf(fid, '%4.2f %8.4f\n', Mean)
fprintf(fid, '- Covariance: ')
fprintf(fid, '%4.2 %8.4', Covariance)
fclose(fid)

end