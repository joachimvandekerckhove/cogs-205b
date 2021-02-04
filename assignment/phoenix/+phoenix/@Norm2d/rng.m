% Random number generator for BVN
% Input: 1x1 sizes (number of pairs of random numbers). Output: sizesx2 random numbers

function num = rng(obj, sizes)
for i = 1:sizes
	x1(i,1) = normrnd(obj.Mean(1,1),sqrt(obj.Covariance(1,1)),1);
        x2(i,1) = normrnd((obj.Mean(2,1)+sqrt(obj.Covariance(2,2))*obj.Correlation*stand(x1(i,1),obj.Mean(1,1),obj.Covariance(1,1))),(obj.Covariance(2,2)*sqrt(1-obj.Correlation.^2)));
	num = [x1 x2];
end

