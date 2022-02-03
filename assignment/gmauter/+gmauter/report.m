function report(data)

% Expects: Data variable. Promises: Markdown file which presents data.

fid = fopen('gmauter-1.md', 'w')
fprintf(fid, 'Data from cogs205b.csv\n')
fprintf(fid, '%s\n\n', datetime('now'))

Mean = gmauter.Norm2d().estimate(data).Mean
Covariance = gmauter.Norm2d().estimate(data).Mean


fprintf(fid, '- Mean: ')
fprintf(fid, '%4.2f %8.4f\n', Mean)
fprintf(fid, '- Covariance: ')
fprintf(fid, '%4.2 %8.4', Covariance)
fclose(fid)

end