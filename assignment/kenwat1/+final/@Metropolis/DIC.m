function dic = DIC(obj)

% Computes the approximated DIC of the model
[~, CleanSampleY, ~] = CleanHistory(obj);

D = CleanSampleY;
meanD = mean(D);
varD = var(D);

dic = meanD + varD/2;

end