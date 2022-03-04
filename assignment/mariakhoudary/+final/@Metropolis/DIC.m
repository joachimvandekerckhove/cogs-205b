function dic = DIC(obj)

% Computes the approximated DIC of the model
[~, cleanY, ~] = CleanHistory(obj);

D = -2*log(cleanY);

dic = mean(D) + (var(cleanY)/2);
            
end