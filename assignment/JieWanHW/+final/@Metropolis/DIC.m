function dic = DIC(obj)

% Computes the approximated DIC of the model
    [CleanSampleX, CleanSampleY, CleanIndex] = obj.CleanHistory();
    M = mean(CleanSampleY);
    V = var(CleanSampleY);
    dic = M + V/2;
            
end