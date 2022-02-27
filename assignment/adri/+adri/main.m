% A unction that directly executes: getData, readData and report
function main()
    import adri.*
    download = getData('http://cidlab.com/files/cogs205b.csv');
    read = readData(download);
    report(read);
end
