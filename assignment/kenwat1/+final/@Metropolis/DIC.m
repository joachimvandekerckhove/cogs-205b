function dic = DIC(obj)

% Computes the approximated DIC of the model
[~,CleanSampleY,~] = obj.CleanHistory();

D = -2.*CleanSampleY;
meanD = mean(D);
varD = var(D);

dic = meanD + (varD/2);

end