function report(obj, X);
% Print out the report to a Markdown file

% Expects: A MATLAB variable containing bivariate (X and Y) data.
% Promises: Produces a file, formatted in Markdown, that presents the mean
% and covariance of the data in a human-readable way and uses some basic
% formatting (e.g., the report should have a title, present the results as
% a bullet point list, maybe tells us the date, etc.).


fileID=fopen('cogs205report.md','w');

fprintf(fileID, 'Data report\n');

fprintf(fileID, 'Mean for x:\n');

fprintf(fileID, '%f\n',obj.Mean(1));

fprintf(fileID, 'Mean for y:\n');

fprintf(fileID, '%f\n',obj.Mean(2));

fprintf(fileID, 'Covariance for the data:\n');

fprintf(fileID, '%g\n',obj.Covariance(1,2));

fclose(fileID);

end