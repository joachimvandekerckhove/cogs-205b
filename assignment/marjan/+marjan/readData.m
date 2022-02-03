% readData.
% This function reads the datafile using the filename and puts it in a variable
function [outputArg1] = readData(filename)
    %%filename = 'cogs205b.csv'
    fileID = fopen(filename,"r");
    S = readlines(filename);
    formatSpec = '%f,%f';
    n=size(S);
    out=[];
    count=1;
    for i =1:n
        A=sscanf(S(i),formatSpec);
        if ~isempty(A)
             out(1,count)=A(1,1);
             out(2,count)=A(2,1);
             count=count+1;
        end
    end
    fclose(fileID);
    outputArg1 = out';
end