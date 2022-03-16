function disp(obj)
    %fprintf('Helloworld');
    if isempty(obj.XHistory)
        fprintf('There is no estimated parameters. \n')
    elseif size(obj.XHistory)==1
        fprintf('Run the Drawsample to start the sampling process. \n')
    else
        [CleanSampleX, ~, ~]=CleanHistory(obj);
        fprintf('Here are the parameters estimation:\n')
        M_ClX=mean(CleanSampleX,2);
        St_ClX=std(CleanSampleX,0,2);
        fprintf('Mean & Standarddeviation of the parameters:\n')
        for i=1:size(CleanSampleX, 1)
            fprintf('Mean=%.3f', M_ClX(i));
            fprintf('Standarddeviation=%.3f \n', St_ClX(i));
            
            
        end
    end
end
