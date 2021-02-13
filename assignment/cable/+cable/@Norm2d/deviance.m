function dev = deviance(obj,Data)
    % Data is an n*2 matrix (2 cols, n rows)
    dev = (-2) * sum(logpdf(obj,Data),'all');
end
