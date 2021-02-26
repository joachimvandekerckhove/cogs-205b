function main()
%MAIN Generate report for data http://cidlab.com/files/cogs205b.csv 
%   Downloads data from url, estimate Norm2d object from data, generate
%   report of the data 

    url = 'http://cidlab.com/files/cogs205b.csv';
    filename = groot.getData(url);
    datamat = groot.readData(filename);
    groot.report(datamat);
    
end

