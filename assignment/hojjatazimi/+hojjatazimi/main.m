url = 'http://cidlab.com/files/cogs205b.csv';

file_name = hojjatazimi.getData(url);
data = hojjatazimi.readData(file_name);

strct = data2strct(data);
dir = PWD();

hojjatazimi.report(strct, [dir 'hojjatazimi-1.md'])

function strct = data2strct(data)
numbers = regexp(data,'(-)?\d+(\.\d+)?(e(-|+)\d+)?','match');
X = str2double(numbers(1:2:20));
Y = str2double(numbers(2:2:20)); 
strct.X = X;
strct.Y = Y;
end

function dir = PWD()
full_path = mfilename("fullpath");
full_path_length = length(full_path);
dir = full_path(1:full_path_length-4);
end