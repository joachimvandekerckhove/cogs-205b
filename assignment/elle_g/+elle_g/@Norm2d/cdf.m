        % Cumulative distribution function
        function yax = cdf(obj, xax) %credit: xavier
            yax =  mvncdf(xax', obj.Mean', obj.Covariance)';
        end