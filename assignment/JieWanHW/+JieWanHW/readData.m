% Input the local filename and you can get a variable stored the content of that file.

function data = readData(filename)
%     if ~exist(filename,'file')
%         error('readData:datafileNotExisted','Existed data file needed.')
%     else
%         data = readmatrix(filename);
%     end
    data = readmatrix(filename);
end