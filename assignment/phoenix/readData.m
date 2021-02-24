% Read local (csv) file
% Input: local file name in 'quotes'
% Ouput: matrix of data

function data = readData(file)
	data = readtable(file);
	data = data{:,:};
	
	%Check to make sure data correct size
	assert((size(data,1)== 2)||(size(data,2)== 2),"Incorrect dimensions in data")
	
	%fprintf("Data read as 2xn matrix\n")

end
