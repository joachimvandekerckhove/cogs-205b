%Disregard this script, this is just used for testing directly on the
%console
A = 100;
B = 100;
E = 1;        
beta = 1;
objective = @(x) sum((data-(x(1) + (x(2)*(N+x(3)).^(-x(4))))).^2);
[x, fval] = fminsearch(objective,[A B E beta],options)