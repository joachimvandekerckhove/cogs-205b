function report(data)

% Expects: Data variable. Promises: Markdown file which presents data.

fid = fopen('gmauter-1.md', 'w');
fprintf(fid, 'Data from cogs205b.csv\n');
fprintf(fid, '%s\n\n', datetime('now'));

Mean = gmauter.Norm2d().estimate(data).Mean;
Covariance = gmauter.Norm2d().estimate(data).Covariance;


fprintf(fid, '- Mean:\n');
fprintf(fid, '\t%8.4f %8.4f\n', Mean);
fprintf(fid, '- Covariance:\n');
fprintf(fid, '\t%8.4f %8.4f\n', Covariance);
fclose(fid);

end
