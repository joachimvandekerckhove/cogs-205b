function dic = DIC(obj)

% Computes the approximated DIC of the model
    [CleanSampleX, CleanSampleY, CleanIndex] = obj.CleanHistory();
    M = mean(-2*CleanSampleY);
    V = var(-2*CleanSampleY);
    dic = M + V/2;
            
end