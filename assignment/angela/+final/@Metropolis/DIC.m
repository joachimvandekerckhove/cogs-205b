function dic = DIC(obj)

% Computes the approximated DIC of the model

%             error('Not yet implemented')

[~, CleanSampleY, ~] = CleanHistory(obj);

d = -2*CleanSampleY;
mean_d = mean(d);
var_d = var(d);

dic = mean_d + var_d/2;

            
end