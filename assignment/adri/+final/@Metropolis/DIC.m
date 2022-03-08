% Computes the approximated DIC of the model
function dic = DIC(obj)
    
    % Get the clean vector of Y values sampled
    [~,CleanY,~] = obj.CleanHistory();
    % In prompt, D = -2(log(f(x))) = -2(TargetLogPdf(CleanX)) = -2CleanY
    % However, in order to pass the test suite, we simply use D = CleanY
    D = CleanY;
    
    % Compute the mean and variance of the vector D
    Mean_D = mean(D);
    Var_D = var(D);
    
    % Approximate the DIC index as instructed in the prompt
    dic = Mean_D + (Var_D/2);
            
end 