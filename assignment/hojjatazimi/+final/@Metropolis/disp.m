function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

if isempty(obj.XHistory)
    disp('parameters have not been estimated, yet!')
else
    disp('parameters have been estimated!')
    disp('Mean:')
    mean(obj.XHistory')
    disp('Standard Deviation:')
    std(obj.XHistory')
end

end