function disp(obj)
    fprintf('Results after running Metropolis algorithm:\n')
    dic = obj.DIC();
    fprintf('(1) The DIC of this model is %d.\n',dic)
    fprintf('(1) The Estimated parameters of this model is:\n')
    [CleanSampleX, CleanSampleY, CleanIndex] = obj.CleanHistory();
    estimate = mean(CleanSampleX,2);
    post_std = std(CleanSampleX,0,2);
    for i=1:length(estimate)/2
        fprintf('Estimated A&B +/- std A&B:\n (%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate((i*2-1):i*2), post_std((i*2-1):i*2))
    end
    %fprintf('(%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate, post_std)
    % plotting easy medium hard
end