        % Log Cumulative density function
        function yax = logCdf(obj, xax)
            yax=log(obj.cdf(xax));          % changed n to xax here
        end