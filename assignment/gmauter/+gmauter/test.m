function test()

% runs basic test suite of functions in package
% command window displays test results

url = 'http://cidlab.com/files/cogs205b.csv'


file_name = gmauter.getData(url)

X = gmauter.readData(file_name)

gmauter.Norm2d().estimate(X)

gmauter.report(X)

end