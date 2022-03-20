function out=DIC(obj)

% Computes the approximated DIC of the model
[~, CleanSampleY, ~]=CleanHistory(obj);
D=-2.*CleanSampleY;
Mean=mean(D);
Variance=var(D);
out=Mean+Variance/2;       

end