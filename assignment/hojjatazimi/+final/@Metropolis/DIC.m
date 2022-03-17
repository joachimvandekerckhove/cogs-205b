function dic = DIC(obj)

% Computes the approximated DIC of the model

[~, Y] = obj.CleanHistory();
D = Y;
dic = mean(D') + var(D')/2;
    
end