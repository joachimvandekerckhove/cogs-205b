function obj = transposeOutput(obj)
% Doing this bc the X input is 2*1, but the expected output is n*2

obj.XHistory = obj.XHistory';
obj.YHistory = obj.YHistory';
end