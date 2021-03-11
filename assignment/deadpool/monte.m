% Main function
gx = @(x) (4 / 3) .* pi .* ((x).^3); 

% Mean radius
mu = 1.234/2;

% Standard deviation of radius
sigma = sqrt( (0.091^2) / 4 );

% Get volume
xax = (randn(1e4,1) .* sigma) + mu;

volume = mean(gx(xax));
