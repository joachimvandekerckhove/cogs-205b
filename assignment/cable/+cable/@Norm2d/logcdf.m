function logcdfOut = logcdf(X,Mu,Sigma)
    % freebie
    verifyMean(Mu);
    verifySigma(Sigma);
    verifyX(X);
    logcdfOut = log(mvncdf(X,Mu,Sigma));
end