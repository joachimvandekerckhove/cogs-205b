function disp(obj)

if isempty(obj.ProposedPointX)
    fprintf('                Metropolis object \n ---------------------------------------------------------------------------------------------- \n')
    fprintf('No parameters to report. Use DrawSamples to begin estimation.\n')
else
    [cleanX, ~,~]=CleanHistory(obj);

    fprintf('                Metropolis object \n ---------------------------------------------------------------------------------------------- \n')
    fprintf('Parameter estimates after %i rounds of sampling: \n', size(obj.YHistory,2)-1);
    for i = 1:size(cleanX, 1)
        fprintf('Parameter %i \n\t Mean = %.3f \n\t SD = %.3f \n', i, mean(cleanX(i,:)), std(cleanX(i,:)));
    end
end
end