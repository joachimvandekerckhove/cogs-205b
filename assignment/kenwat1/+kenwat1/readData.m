function data = readData(filename)
% Input is the name of a local file, and outputs a variable containing data
data = readmatrix(filename);
save('bivData','data')

end

