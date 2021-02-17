function pdfOut = pdf(obj,X)
    % Calculate the probability density function
    % X is a 2xn matrix
    % pdfOut is a 1xn matrix

    rho = obj.Rho;
    sigma1 = sqrt(obj.Covariance(1,1));
    sigma2 = sqrt(obj.Covariance(2,2));
    z = ((X(1,:) - obj.Mean(1))/sigma1).^2 - ...
        2 * rho .* ((X(1,:) - obj.Mean(1))/sigma1) .* ...
        ((X(2,:) - obj.Mean(2))/sigma2) + ...
        ((X(2,:) - obj.Mean(2))/sigma2).^2;

    pdfOut = 1/(2*pi*sigma1*sigma2*sqrt(1 - rho^2)) * ...
        exp((-1/2) * z/(1 - rho^2));
end
