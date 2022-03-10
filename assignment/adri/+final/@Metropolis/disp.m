% Display:
% (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter estimated.
function disp(obj)
    line = repmat('~', 1, 73);
    fprintf('*%s*\n', line);  
    fprintf('*%s*\n', line);   
    fprintf('Adri´s Metropolis sampling class\n')
    fprintf('*%s*\n', line);      
    if isempty(obj.XHistory)
        fprintf("Whoops!!\n")
        fprintf("The sampling process hasn't been started yet.\n")
        fprintf("No parameter estimations available.\n")
    else
        fprintf("Woot woot!\n")
        fprintf("Parameter estimates available.\n")
        fprintf('*%s*\n', line); 
        [X,~,~] = obj.CleanHistory;
        Mean_X = mean(X,2);
        Std_X = std(X,[],2);
        NoParams = size(X,1);
        if NoParams == 4
            fprintf("As per the final assignment for COGS 205B,\n")
            fprintf("we interpret the 4-parameter TargetLogPdf to be the: CONSTRAINED MODEL\n")            
            fprintf("Mean of B0A: %6.3f\n", Mean_X(1));
            fprintf("SD of B0A:   %6.3f\n", Std_X(1));
            fprintf("Mean of B1A: %6.3f\n", Mean_X(2));
            fprintf("SD of B1A:   %6.3f\n", Std_X(2));            
            fprintf("Mean of B0B: %6.3f\n", Mean_X(3));
            fprintf("SD of B0B:   %6.3f\n", Std_X(3));            
            fprintf("Mean of B1B: %6.3f\n", Mean_X(4));
            fprintf("SD of B1B:   %6.3f\n", Std_X(4));
        else
            if NoParams == 6
            fprintf("As per the final assignment for COGS 205B,\n")
            fprintf("we interpret the 4-parameter TargetLogPdf to be the: SATURATED MODEL\n") 
                fprintf("(Scale) Mean of A_e: %6.3f\n", Mean_X(1));
                fprintf("(Scale) SD of A_e:   %6.3f\n", Std_X(1));
                fprintf("(Scale) Mean of A_m: %6.3f\n", Mean_X(2));
                fprintf("(Scale) SD of A_m:   %6.3f\n", Std_X(2));
                fprintf("(Scale) Mean of A_h: %6.3f\n", Mean_X(3));
                fprintf("(Scale) SD of A_h:   %6.3f\n", Std_X(3));
                fprintf("(Shape) Mean of B_e: %6.3f\n", Mean_X(4));
                fprintf("(Shape) SD of B_e:   %6.3f\n", Std_X(4));
                fprintf("(Shape) Mean of B_m: %6.3f\n", Mean_X(5));
                fprintf("(Shape) SD of B_m:   %6.3f\n", Std_X(5));
                fprintf("(Shape) Mean of B_h: %6.3f\n", Mean_X(6));
                fprintf("(Shape) SD of B_h:   %6.3f\n", Std_X(6));
            else
                fprintf("Unknown TargetLogPdf function inserted\n");
                for i = 1:size(X,1)                    
                    fprintf("Mean of Parameter%1g: %6.3f\n",i, Mean_X(i));
                    fprintf("SD of Parameter%1g:   %6.3f\n",i, Std_X(i));
                end
            end
        end
        fprintf('*%s*\n', line); 
        fprintf('*%s*\n', line); 
    end  
end
