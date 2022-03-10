function plotMetrop(obj, txt)

    [CleanSampleX, ~, ~] = obj.CleanHistory();

    figure()
    for i = 1:size(CleanSampleX, 1)
        plot(CleanSampleX(i, :), 'linewidth', 2);
        hold on
    end
    hold off;
    xlim([-0.5, length(CleanSampleX)]);
    xlabel('N Updates')
    title(txt);
    
   
end

