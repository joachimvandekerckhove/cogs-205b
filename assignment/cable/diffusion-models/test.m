data = [1 -2 2 -1];
p = WienerNode(data);

parameters = [0 1 .2 .5];
p.logPdf(parameters)

%   -2.8031   -7.7379   -7.7379   -2.8031
