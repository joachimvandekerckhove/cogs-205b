% Main function to be integrated
gx = @(x) sqrt(1-x^2);

% Number of bins
B = 300;

% bin endpoints
bins = linspace(-1,1,B+1);

% Estimating area of upper halve circle
for i = 1:B

	% Left edge of bin
	x1 = bins(i);

	% Right edge of bin
	x2 = bins(i+1);

	% Function at lwft edge
	y1 = gx(x1);

	% Function at right edge
	y2 = gx(x2);

	% Height of bin
	h = (y1+y2) / 2;
	
	% Area of each trapezoid
	area(i) = h * (x2 - x1);

end 

A = 2 * sum(area)
