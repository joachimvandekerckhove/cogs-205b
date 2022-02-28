% Checking initial values set by user
function stopFit = checkValues(obj,A,B,E,beta)

    % Default objects before inspection
    stopFit = 0;
    invalidValue = [];
    pars = ["Asymptote (A)", "Range (B)", "Exposure (E)", "Rate (Beta)"];
    
    % Detect initial values that may be invalid
    % Asymptote corresponds to RTs
    if A < 0 
        invalidValue(1) = 1;
    end
    % Negative Range causes the function to increase
    if B < 0 
        invalidValue(2) = 1;
    end
    % Exposure is related to practice. Can't be negative.
    if E < 0
        invalidValue(3) = 1;
    end
    % Negative Rate causes the function to increase. Small values expected.
    if beta < 0 || beta > 5
        invalidValue(4) = 1;
    end
   
    %We check whether an invalid initial value was set
    if sum(invalidValue) > 0
        line = repmat('-', 1, 73);    
        problemParam = pars(logical(invalidValue));
        %If it's only one invalid value, we test the SSE computed from 
        % this initial set of parameters to determine whether we stop 
        % the optimization or we disregard the warning
        if sum(invalidValue) == 1       
               fprintf('*%s*\n', line); 
               fprintf('WARNING:\n')
               fprintf('One of the initial values set by the user may be invalid.\n')
               fprintf('                  (Check the value set for: %s)\n', problemParam)
               fprintf('...ADDITIONAL CHECK...\n')
               fprintf('Evaluating the SSE computed with these initial values.\n')
               testSSE = obj.sse(A,B,E,beta);
               fprintf('.............................Initial SSE of: %g\n', testSSE)
       
               % Evaluating SSE computed
               if ~isnan(testSSE) && ~isinf(testSSE) && isnumeric(testSSE)
                    fprintf('WARNING DISMISSED: The initial SSE did NOT show any errors.\n')
                    fprintf('\n')
                    fprintf('- - - - - - - - - - - - - Optimizing SSE to get parameter estimates - - - -\n')
               else
                    fprintf('WARNING:\n')
                    fprintf('The initial SSE could not be computed\n')
                    fprintf('Please set new parameter values')
                    stopFit = 1; %Flag!            
               end
        else
        %If more than one initial values are invalid, we set a flag to stop
        %the optimization process right away
        fprintf('*%s*\n', line); 
        fprintf('WARNING:\n')
        fprintf('The following Initial Values set by the user are invalid:\n')
        fprintf('- - - - - - - > Check the value set for: %s)\n', problemParam)
        stopFit = 1; %Flag!
        end
    %No flag is produced if no invalid value is detected
    else
        disp('Initial values set by the user are VALID')
    end

end