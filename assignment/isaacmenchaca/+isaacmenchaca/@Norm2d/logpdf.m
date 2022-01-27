function yax = logpdf(obj, X)
    
    z = standardized(obj, X);
    yax = -0.5 * (z ./ (1 - obj.Correlation ^ 2)) * log( 1 / (2 * pi * obj.sigma1 * obj.sigma2 * sqrt(1 - obj.Correlation ^ 2)));
      
end
