function disp(obj)
    fprintf('Results after running Metropolis algorithm:\n')
    dic = obj.DIC();
    fprintf('(1) The DIC of this model is %d.\n',dic)
    fprintf('(1) The Estimated parameters of this model is:\n')
    [CleanSampleX, CleanSampleY, CleanIndex] = obj.CleanHistory();
    estimate = mean(CleanSampleX,2);
    post_std = std(CleanSampleX,0,2);
    fprintf('Following parameters estimations are for Easy, Medium, and Hard sequentially:\n')
    numparsets = length(estimate)/2;

    % DISP for AABB
    for i=1:numparsets
        fprintf('Estimated A&B +/- std A&B:\n (%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate([i,(i+numparsets)]), post_std([i,(i+numparsets)]))
    end

    % DISP for ABAB
    % for i=1:numparsets
    %     fprintf('Estimated A&B +/- std A&B:\n (%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate([(2*i-1),2*i]), post_std([(2*i-1),2*i]))
    % end
    
    %fprintf('(%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate, post_std)
    % plotting easy medium hard
end