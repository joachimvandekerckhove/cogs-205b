function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

    data = obj.CleanHistory();
    
    if obj.XHistory == obj.InitialValues
        m = '------------- Parameters have not been estimated ------------- \n';
        fprintf(m);
        fprintf('\n');
        return
    else
        m = '------------- Parameters have been estimated ------------- \n';
        fprintf(m);
        fprintf('\n');
    end
    
    if size(data, 1) == 6
        model = 'For the <strong>saturated</strong> model, there are 6 parameters \n';
        scale = 'Scale Parameter Estimates:     \n';
        shape = 'Shape Parameter Estimates:     \n';
        s = '     %-5s: mean = %g, variance = %g \n';
        d = 'DIC = %g     \n';
        
        fprintf(model);
        
        fprintf('\n');
        
        fprintf(scale);
        fprintf(s, 'Easy Condition', mean(data(1,:)), var(data(1,:)));
        fprintf(s, 'Medium Condition', mean(data(2,:)), var(data(2,:)));
        fprintf(s, 'Hard Condition', mean(data(3,:)), var(data(3,:)));
        
        fprintf('\n');
        
        fprintf(shape);
        fprintf(s, 'Easy Condition', mean(data(4,:)), var(data(4,:)));
        fprintf(s, 'Medium Condition', mean(data(5,:)), var(data(5,:)));
        fprintf(s, 'Hard Condition', mean(data(6,:)), var(data(6,:)));
        
        fprintf('\n');
        
        fprintf(d, obj.DIC);
        
        fprintf('\n');
         
        fprintf('----------------------------------------------------------');
        
        fprintf('\n');
        
    elseif size(data, 1) == 4
        model = 'For the <strong>constrained</strong> model, there are 6 parameters \n';
        scale = 'Scale Parameter Estimates:     \n';
        shape = 'Shape Parameter Estimates:     \n';
        s = '     %-5s: mean = %g, variance = %g \n';
        d = 'DIC = %g     \n';
        
        fprintf(model);
        
        fprintf('\n');
        
        fprintf(scale);
        fprintf(s, 'Easy Condition', mean(data(1,:)), var(data(1,:)));
        fprintf(s, 'Medium Condition', mean(data(1,:) + data(3,:)), ...
                var(data(1,:) + data(3,:)));
        fprintf(s, 'Hard Condition', mean(data(1,:) + 2 * data(3,:)), ...
                var(data(1,:) + 2 * data(3,:)));
            
        fprintf('\n');
        
        fprintf(shape);
        fprintf(s, 'Easy Condition', mean(data(3,:)), var(data(3,:)));
        fprintf(s, 'Medium Condition', mean(data(2,:) + data(4,:)), ...
                var(data(2,:) + data(4,:)));
        fprintf(s, 'Hard Condition', mean(data(2,:) + 2 * data(4,:)), ...
                var(data(2,:) + 2 * data(4,:)));
        
        fprintf('\n');
        
        fprintf(d, obj.DIC);
        
        fprintf('\n');
 
        fprintf('----------------------------------------------------------');
        
        fprintf('\n');
        
    end

end