% Input the local filename and you can get a variable stored the content of that file.

function data = readData(filename)
	%data = readtable(filename);
	data = readmatrix(filename);
end