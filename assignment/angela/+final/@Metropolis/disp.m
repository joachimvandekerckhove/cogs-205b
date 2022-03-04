function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

%     error('Not yet implemented')


if size(obj.XHistory,2) > 1
    fprintf('\nHello!')
    
    % calculate summary statistics
    [CleanSampleX, ~, ~] = CleanHistory(obj);
    CleanSampleX = CleanSampleX';
    mean_estimates = mean(CleanSampleX);
    sd_estimates = std(CleanSampleX);
    
    % plot
    plotornot = input('\nDo you want a plot of the parameter estimates? y or n: ','s');
    if plotornot == 'y'
        
        figure
        % estimates x samples
        subplot(2,2,[1:2])
        plot(obj.XHistory')
        hold on
        % please excuse this crap code
        if size(obj.XHistory,1) == 6
            legend('A_e','A_m','A_h','B_e','B_m','B_h') % saturated model
        elseif size(obj.XHistory,1) == 4
            legend('scale intercept','scale slope','shape intercept','shape slope') % constrained model
        end
        title('XHistory')
        ylabel('parameter estimates')
        xlabel('samples')

        % calculate parameters for constrained model
        if length(mean_estimates) == 4
            A_e = mean_estimates(1);
            A_m = mean_estimates(1) + mean_estimates(2);
            A_h = mean_estimates(1) + 2*mean_estimates(2);
            B_e = mean_estimates(3);
            B_m = mean_estimates(3) + mean_estimates(4);
            B_h = mean_estimates(3) + 2*mean_estimates(4);
            
            % scale parameter
            subplot(2,2,3)
            plot(1:3,[A_e,A_m,A_h],'+')
            axis([0 4 1 4])
            conditions = {'easy','medium','hard'};
            set(gca,'XTick',1:3,'XTickLabels',conditions)
            ylabel('Scale parameter')
            xlabel('Conditions')
            
            % shape parameter
            subplot(2,2,4)
            plot(1:3,[B_e,B_m,B_h],'+')
            axis([0 4 1 4])
            set(gca,'XTick',1:3,'XTickLabels',conditions)
            ylabel('Shape parameter')
            xlabel('Conditions')
            
        % saturated model    
        else
            % scale parameter
            subplot(2,2,3)
            plot(1:3,mean_estimates(1:3),'+')
            axis([0 4 1 4])
            conditions = {'easy','medium','hard'};
            set(gca,'XTick',1:3,'XTickLabels',conditions)
            ylabel('Scale parameter')
            xlabel('Conditions')
            
            % shape parameter
            subplot(2,2,4)
            plot(1:3,mean_estimates(4:6),'+')
            axis([0 4 1 4])
            set(gca,'XTick',1:3,'XTickLabels',conditions)
            ylabel('Shape parameter')
            xlabel('Conditions')
        end
    else
        fprintf('\nOkay, no plot. Moving on...')
    end
    
    % print
    for ii = 1:length(mean_estimates)
        fprintf('\n\tParameter %i: mean = %.2f, sd = %.2f',ii,mean_estimates(ii),sd_estimates(ii)),
    end
    fprintf('\nDone!\n')
        
else
    fprintf('\nHello! I am a Metropolis object.')
    fprintf('\nMy initial values are:')
    for ii = 1:length(obj.InitialValues)
        fprintf('\n\tParameter %i: %.2f',ii,obj.InitialValues(ii))
    end
    fprintf('\nI currently have no parameter estimates.')
    fprintf('\nPlease draw samples to estimate parameters.\n')
end

end
