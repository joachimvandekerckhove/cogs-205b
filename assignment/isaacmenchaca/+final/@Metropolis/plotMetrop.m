function plotMetrop(obj, txt, labels, location)

    [CleanSampleX, ~, ~] = obj.CleanHistory();

    f = figure();
    f.Position(3:4) = [550 470];
    for i = 1:size(CleanSampleX, 1)
        plot(CleanSampleX(i, :), 'linewidth', 2);
        hold on
    end
    hold off;
    xlim([-0.5, length(CleanSampleX)]);
    xlabel('N Updates')
    title(txt);
    legend(labels, Location=location);
   
end

