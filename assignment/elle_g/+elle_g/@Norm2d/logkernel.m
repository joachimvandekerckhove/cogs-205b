        %log kernel
        function k = logkernel(obj, xax) %credit: xavier

            % Standardize the x values
            st = (xax - obj.Mean) ./ sqrt(diag(obj.Covariance));

            % Get the z score
            z = sum(st.^2, 1) - 2 * obj.Correlation * prod(st, 1);

            % Scale the kernel
            k = -0.5 ./ (1 - obj.Correlation^2) * z;

        end