url='http://www.cidlab.com/files/cogs205b.csv';
Data=webread(url,'x','y');
Data=webread(url);


Data=readtable('cogs205b.csv');


urlwrite(url,'cogs205b.csv');
x=Data{:,1};
y=Data{:,2};