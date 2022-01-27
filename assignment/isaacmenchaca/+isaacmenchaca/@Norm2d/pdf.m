function yax = pdf(obj, X)
    z = standardized(obj, X);
    
    yax =  1 / (2 * pi * obj.sigma1 * obj.sigma2 * sqrt(1 - obj.Correlation ^ 2)) ...
            .* exp(-0.5 * (z ./ (1 - obj.Correlation ^ 2)));
                
end

