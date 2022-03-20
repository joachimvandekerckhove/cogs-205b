function dic = DIC(obj)

% Computes the approximated DIC of the model

[~, CleanSampleY, ~] = obj.CleanHistory();

d = -2 * CleanSampleY;
m = mean(d);
v = var(d);
dic = m + v/2;
            
end