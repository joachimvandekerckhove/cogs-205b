function main()
% The main function

% Expects: No input.
% Promises: After running this function, your package directory should
% contain a report file named pseudonym-1.md that contains the mean and
% covariance of the bivariate data that are contained in
% http://cidlab.com/files/cogs205b.csv at the time it was run.



url='http://cidlab.com/files/cogs205b.csv';
[fileName]=getData(url);
[X] = readData(fileName);

obj=Adam.Norm2d();

obj=obj.estimate(X);

report(obj, X);

end
