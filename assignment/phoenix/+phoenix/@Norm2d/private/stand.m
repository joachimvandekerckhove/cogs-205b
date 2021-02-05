% Standardize (Z-score) a value
% Input: nx1 value(s), associated Mean and Variance. Output: nx1

function z = stand(x, mu, sigma2)

z = (x(:,1) - mu(:,1)) ./ sqrt(sigma2(:,1));

end
