function dic = DIC(obj)

% Computes the approximated DIC of the model

%             error('Not yet implemented')

[~, CleanSampleY, ~] = CleanHistory(obj);

mean_d = mean(CleanSampleY);
var_d = var(CleanSampleY);

dic = mean_d + var_d/2;

            
end