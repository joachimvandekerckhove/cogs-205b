function yax = rnd(obj, size)
   % RNG Random number generation for Norm2d
   % Input: 1x1 sizes (number of pairs of random numbers). Output: sizesx2 random numbers 
   
% Generate random samples from first distribution (1xN vector)
x1 = random('Normal', obj.Mean(1), obj.StandardDev(1), [1,size]);
x2_mean = obj.Mean(2) + obj.StandardDev(2) * obj.Correlation * ...
    ((x1 - obj.Mean(1)) / obj.StandardDev(1));
x2_std = obj.Covariance(2,2) * sqrt(1 - obj.Correlation^2);
x2 = random('Normal', x2_mean, x2_std, [1,size]);

yax = [x1; x2];
end
