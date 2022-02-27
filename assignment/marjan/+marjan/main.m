%main.
%This function creates a .mfile that calls required functions
function main()
url="https://cidlab.com/files/cogs205b.csv";
filename="cogs205b.csv";
%%gets and reads data file
marjan.getData(url,filename);
Data=marjan.readData(filename);
%%reports data
marjan.report(Data);
%marjan.Contents();  
