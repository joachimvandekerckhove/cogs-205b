function DIC = DIC(obj)

% Computes the approximated DIC of the model
% .DIC(), should compute DIC = M(D) + V (D)/2, where D is the vector of
% -2 log posterior (−2log(p(θ|X))) values at all sampled proposals, 
% M(·) is the mean and V(·) is the variance. 
% DIC is a rudimentary model comparison metric, 
% with lower values meaning better model performance.

    [~, CleanSampleY, ~] = obj.CleanHistory();
    DIC = mean(CleanSampleY) + (var(CleanSampleY) / 2);
            
end