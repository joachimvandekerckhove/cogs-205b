function main()

% Expects: Nothing. Promises: Report file gmauter-1.md.

url = 'http://cidlab.com/files/cogs205b.csv';

file_name = gmauter.getData(url);

X = gmauter.readData(file_name);

gmauter.report(X)


end
