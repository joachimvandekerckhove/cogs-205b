%report file for data from url
function main()
    url='http://cidlab.com/files/cogs205b.csv';
    file=elle_g.getData(url);
    data=elle_g.readData(file);
    elle_g.report(data)
end
 
