        % Random number generator
        function x = rnd(obj, sz)            
            if nargin < 2, sz = 1; end            
            % Sample from two normals
            z = randn(2,sz); %credit: xavier

            % Transform to new mean and covariance
            %credit: xavier
            x(1,:) = obj.Mean(1) + sqrt(obj.Covariance(1)) * z(1,:);
            x(2,:) = obj.Mean(2) + sqrt(obj.Covariance(4)) * obj.Correlation * z(1,:) ...
                + sqrt(obj.Covariance(4) * ( 1 - obj.Correlation^2)) * z(2,:);      
        end