function output6 = deviance(Data, Mu, Sigma)
    
    output6 = sum(logpdf(Data, Mu, Sigma)) * -2;

end


