function z = standardized(obj, X)
        
    x1 = (X(1,:));
    x2 = (X(2,:));
    % could define mu1 and mu2 simmilar to x1 and x2
    z = ((x1 - obj.Mean(1)) / obj.sigma1) .^ 2 ...
         - 2 * obj.Correlation * ((x1 - obj.Mean(1)) / obj.sigma1) .* ((x2 - obj.Mean(2)) / obj.sigma2) ...
            + ((x2 - obj.Mean(2)) / obj.sigma2) .^ 2;
end