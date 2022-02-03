function main()

% runs through package, creates markdown file

url = 'http://cidlab.com/files/cogs205b.csv'

file_name = gmauter.getData(url)

X = gmauter.readData(file_name)

gmauter.Norm2d().estimate(X)

gmauter.report(X)


end