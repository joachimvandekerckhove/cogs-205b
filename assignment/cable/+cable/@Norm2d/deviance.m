function dev = deviance(Data,Mu,Sigma)
    % Data is an n*2 matrix (2 cols, n rows)
    X = linspace(1,size(Data,1),size(Data,1));
    X = [X,X];
    dev = (-2) * sum(logpdf(X,Mu,Sigma),'all');
end