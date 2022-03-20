function dic = DIC(obj)

% Computes the approximated DIC of the model

    [~, D] = obj.CleanHistory();
    dic = mean(-2 * D) + (var(-2 * D) / 2);
    
end