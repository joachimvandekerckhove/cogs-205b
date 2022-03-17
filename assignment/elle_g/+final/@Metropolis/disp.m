function disp(obj)
    if size(obj.XHistory)==0
        fprintf('No parameters have been estimated\n')
    else
        [CX, ~, ~]=CleanHistory(obj);
        if size(CX, 1)==6
            fprintf('Generating Parameter Estimates for the SATURATED Model:\n')
            pause(.5)
            fprintf('NOTE: Scale=A\tShape=B\n\n');
            fprintf('Scale Easy (Ae)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(1, :)), std(CX(1, :)))
            fprintf('Shape Easy (Be)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(2, :)), std(CX(2, :)))
            fprintf('Scale Medium (Am)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(3, :)), std(CX(3, :)))
            fprintf('Shape Medium (Bm)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(4, :)), std(CX(4, :)))
            fprintf('Scale Hard (Ah)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(5, :)), std(CX(5, :)))
            fprintf('Shape Hard (Bh)\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(6, :)), std(CX(6, :)))

        else
            fprintf('\n\nGenerating Parameter Estimates for the CONSTRAINED Model:\n')
            pause(.5)
            fprintf('Scale Intercept\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(1, :)), std(CX(1, :)))
            fprintf('Scale Slope\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(2, :)), std(CX(2, :)))
            fprintf('Shape Intercept\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(3, :)), std(CX(3, :)))
            fprintf('Shape Slope\n Mean: %1.4f\t Standard Deviation: %1.4f\n', mean(CX(4, :)), std(CX(4, :)))
        end
    end
end