function main(url)
% Produces a report in my package directory by running all the functions

if nargin < 1
    url = 'http://cidlab.com/files/cogs205b.csv';
end

filename = kenwat1.getData(url);
data = kenwat1.readData(filename);
if size(data,1)~=2 && size(data,2)==2
    X = data';
else
    X = data;
end
if size(X,1)~=2
    msg = 'Wrong size, input must be a 2xn matrix';
    error(msg);
end

kenwat1.report(X)

end

