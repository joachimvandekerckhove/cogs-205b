function out = pdf(obj, X)

    sig_1 = sqrt(obj.Covariance(1));
    sig_2 = sqrt(obj.Covariance(4));

    z_1 = power((X(1, :) - obj.Mean(1))/sig_1, 2);
    z_2 = -2 * obj.Correlation * ((X(1, :) - obj.Mean(1))/sig_1) .* ((X(2, :) - obj.Mean(2))/sig_2);
    z_3 = power( (X(2, :) - obj.Mean(2))/sig_2 , 2);
    z = z_1 + z_2 + z_3;

    scale = 1 / (2 * pi * sig_1 * sig_2 * sqrt(1 - power(obj.Correlation, 2)));

    out = scale * exp(-.5 * z / (1-power(obj.Correlation, 2)));

end