function cdfOut = cdf(X,Mu,Sigma)
    % freebie
    verifyMean(Mu);
    verifySigma(Sigma);
    verifyX(X);
    
    cdfOut = mvncdf(X,Mu,Sigma);
end