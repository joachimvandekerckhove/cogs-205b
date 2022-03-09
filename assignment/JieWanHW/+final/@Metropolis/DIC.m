function dic = DIC(obj)

% Computes the approximated DIC of the model
    [CleanSampleX, CleanSampleY, CleanIndex] = obj.CleanHistory();
    M = mean(CleanSampleY);
    V = var(CleanSampleY);
    dic = (-2)*M + 4*V/2;
            
end