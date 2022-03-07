function out=DIC(obj)

% Computes the approximated DIC of the model
[CleanSampleX, CleanSampleY, CleanIndex]=CleanHistory(obj);
Mean=mean(CleanSampleY);
Variance=var(CleanSampleY);
out=Mean+Variance/2;       

end