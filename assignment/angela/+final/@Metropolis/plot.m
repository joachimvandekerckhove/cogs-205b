function plot(obj)

% calculate summary statistics
[CleanSampleX, ~, ~] = CleanHistory(obj);
CleanSampleX = CleanSampleX';
mean_estimates = mean(CleanSampleX);
sd_estimates = std(CleanSampleX);

% please excuse this crap code
% conditions scale and shape
if length(mean_estimates) == 4 % calculate parameters for constrained model
    A_e = mean_estimates(1);
    A_m = mean_estimates(1) + mean_estimates(2);
    A_h = mean_estimates(1) + 2*mean_estimates(2);
    B_e = mean_estimates(3);
    B_m = mean_estimates(3) + mean_estimates(4);
    B_h = mean_estimates(3) + 2*mean_estimates(4);
elseif length(mean_estimates) == 6
    A_e = mean_estimates(1);
    A_m = mean_estimates(2);
    A_h = mean_estimates(3);
    B_e = mean_estimates(4);
    B_m = mean_estimates(5);
    B_h = mean_estimates(6);
end

%%% plot of parameter estimates %%%
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


%%% plot of data with PDFs %%%
data = final.getFinalData();
figure

% easy condition
subplot(3,1,1)
histogram(data.easy)
hold on
x = linspace(min(data.easy),max(data.easy),512);
plot(x,wblpdf(x,A_e,B_e)*100)
title('easy condition')
legend1 = sprintf('data');
legend2 = sprintf('Weibull PDF: \n\tscale = %.2f \n\tshape %.2f',A_e,B_e);
legend(legend1, legend2)

% medium condition
subplot(3,1,2)
histogram(data.medium)
hold on
x = linspace(min(data.medium),max(data.medium),512);
plot(x,wblpdf(x,A_m,B_m)*100);
title('medium condition')
legend1 = sprintf('data');
legend2 = sprintf('Weibull PDF: \n\tscale = %.2f \n\tshape %.2f',A_m,B_m);
legend(legend1, legend2)

% hard condition
subplot(3,1,3)
histogram(data.hard)
hold on
x = linspace(min(data.hard),max(data.hard),512);
plot(x,wblpdf(x,A_h,B_h)*100);
title('hard condition')
legend1 = sprintf('data');
legend2 = sprintf('Weibull PDF: \n\tscale = %.2f \n\tshape %.2f',A_h,B_h);
legend(legend1, legend2)

end