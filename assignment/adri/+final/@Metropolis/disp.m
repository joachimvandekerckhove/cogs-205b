% Minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter estimated.
function disp(obj)
    line = repmat('-', 1, 73);
    fprintf('Adri´s Metropolis sampling class\n\n')
    fprintf('*%s*\n', line);                    
    if isempty(obj.XHistory)
        fprintf("The sampling process hasn't been started yet.\n")
        fprintf("No parameter estimations available.\n")
    else
        fprintf("Parameter estimates for the Target Log PDF available.\n")
        [X,~,~] = obj.CleanHistory;
        Mean_X = mean(X,2);
        Std_X = std(X,[],2);
        for i = 1:size(X,1)
            fprintf("Mean of Parameter %1g: %1g",i, Mean_X(i));
            fprintf("StDev of Parameter %1g: %1g",i, Std_X(i));
        end
    end  
end
