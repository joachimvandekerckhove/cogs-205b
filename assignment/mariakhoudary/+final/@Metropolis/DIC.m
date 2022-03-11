function dic = DIC(obj)

% Computes the approximated DIC of the model
[~, cleanY, ~] = CleanHistory(obj);

D = -2*cleanY;

dic = mean(D) + (var(D)/2);
            
end