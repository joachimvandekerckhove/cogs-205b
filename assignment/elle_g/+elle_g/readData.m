%read data from table into a matlab matrix
function out = readData(file)
    out=table2array(file);
end

