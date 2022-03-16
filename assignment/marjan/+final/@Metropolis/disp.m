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
%     if size(obj.XHistory, 2) == 1
%         fprintf('Metropolis algorithm not yet ran. Use DrawProposal to do so!\n')
%     else
%         [CleanSampleX, ~, ~] = CleanHistory(obj);
%         fprintf('Estimated Parameters from Metropolis Algorithm:\n')
%         
%         meanOfParameters = mean(CleanSampleX, 2);
%         fprintf('Estimated Mean:\n')
%         for i = 1:size(CleanSampleX, 1)
%             fprintf('\t%0.3f', meanOfParameters(i));
%         end
%             fprintf('\n')
%             
%         stdDevOfParameters = std(CleanSampleX, 0, 2);
%         fprintf('Estimated Std Dev:\n')
%         for i = 1:size(CleanSampleX, 1)
%             fprintf('\t%0.3f', stdDevOfParameters(i));
%         end
%             fprintf('\n')
%         
%     end
%     
% end