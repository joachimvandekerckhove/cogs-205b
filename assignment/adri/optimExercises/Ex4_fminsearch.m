% Read the documentation for MATLAB's |fminsearch| function.  Use it to
% solve Exercise 2 and 3 again.

% NOTES: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fminsearch(Function,StartingValues)
%
% There needs to be a vector of variables (x) so that the output can
% be saved in an [x,fval] object
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EXERCISE 2: Find the maximum of f(x,y) = e^{-x^2-y^2}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We'll use the function fminsearch to look for the minimum of -f(x,y)
objectiveEx2 = @(x) -exp(-sum(x.^2));
[x, fval] = fminsearch(objectiveEx2,[0 1.5])

% EXERCISE 3: Find the minimum of 
% C(x,y) = (4 - 2.1 x^2 + \frac{1}{3}x^4) x^2 + x y + 4 (y^2-1) y^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
objectiveEx3 = @(x) (4 - 2.1*x(1).^2 + x(1).^4/3).*x(1).^2 + x(1).*x(2) + ...
               4*(-1 + x(2).^2).*x(2).^2;
[x, fval] = fminsearch(objectiveEx3,[0 1.5])

