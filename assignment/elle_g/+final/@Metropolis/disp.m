function disp(obj)
    if size(obj.XHistory)==0
        fprintf('No parameters have been estimated\n')
    else
        fprintf('Generating parameter estimates...\n')
        pause(.5)
    end
end