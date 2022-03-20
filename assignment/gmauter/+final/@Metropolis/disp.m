
function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

if isempty(obj.XHistory)
    fprintf('Parameters have not been estimated, run Metropolis algorithm.\n')
else
    fprintf('\n')
    fprintf('\t- Parameters estimated - \n\n')
    [CleanSampleX, ~,~] = CleanHistory(obj);
    meanParams = mean(CleanSampleX, 2);
    stdParams = std(CleanSampleX, 0, 2);

    fprintf('Mean and Standard Deviation of parameters: \n');
    for i = 1:size(CleanSampleX, 1)
        fprintf('Parameter %i ----- mean: %0.3f, sd: %0.3f\n', i, meanParams(i),stdParams(i));
    end
        



end