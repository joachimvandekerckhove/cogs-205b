function dic = DIC(obj)

% Computes the approximated DIC of the model

data = final.getFinalData();
D = -2 * obj.TargetLogPdf(obj.XHistory, data);
dic = mean(D') + var(D')/2;
            
end