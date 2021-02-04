function yax = rng(obj, size)
   % RNG Random number generation for Norm2d
   % returns a 2 x size matrix 
   
% Generate random samples from first distribution (Nx1 vector)
x1 = random('Normal', obj.Mean(1), obj.StandardDev(1), [size,1]);
x2_mean = obj.Mean(2) + obj.StandardDev(2) * obj.Correlation * ...
    ((x1 - obj.Mean(1)) / obj.StandardDev(1));
x2_std = obj.Covariance(2,2) * sqrt(1 - obj.Correlation^2);
x2 = random('Normal', x2_mean, x2_std, [size,1]);

yax = [x1 x2];
end