% Optimization function: Finding the minimum of the SSE
function obj = myFit(obj,A,B,E,beta)          
            
            %Initial values are either defined by user or set by default
            Txt1 = "(defined by user)";            
            Txt2 = "(set by default)";
            Par.setBy = [Txt1 Txt1 Txt1 Txt1];            
            if nargin < 5
               beta = 1;                      
               Par.setBy(4) = Txt2;
               if nargin < 4
                    E = 1;                        
                    Par.setBy(3) = Txt2;
                    if nargin < 3
                        B = 100;                        
                        Par.setBy(2) = Txt2;
                        if nargin < 2 
                            A = 100;
                            Par.setBy(1) = Txt2;                            
                        end                        
                    end                    
                end                               
            end 
            
            % Check if initial values set by the user are valid
            % before estimating parameters for any given data.
            if nargin > 1 && isempty(obj.EstimatedAsymptote)
                valuesFlag = obj.checkValues(A,B,E,beta);
            else
                valuesFlag = 0;
            end
                      
            %Only run the optimization process if there are no currently
            %available parameter estimates nor a problem with the initial
            %values was detected
            line = repmat('-', 1, 73);
            fprintf('*%s*\n', line); 
            if isempty(obj.EstimatedAsymptote) && valuesFlag == 0
                %Optimization!
                objective = @(x) obj.sse(x(1),x(2),x(3),x(4));
                options = optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
                [x, ~] = fminsearch(objective,[A B E beta],options);
                %Retrieving values
                obj.EstimatedAsymptote = x(1);
                obj.EstimatedRange = x(2);            
                obj.EstimatedExposure = x(3);
                obj.EstimatedRate = x(4);            
                % Print to screen initial values used
                fprintf("OPTIMIZATION ran using the following INITIAL VALUES:\n") 
                fprintf("Initial A (Asymptote):    %3g %1s\n", A, Par.setBy(1))
                fprintf("Initial B (Range):        %3g %1s\n", B, Par.setBy(2))
                fprintf("Initial E (Exposure):     %3g %1s\n", E, Par.setBy(3))
                fprintf("Initial beta (Rate):      %3g %1s\n", beta,Par.setBy(4)) 
            else
                if ~isempty(obj.EstimatedAsymptote)
                    %Don't do optimization again until the data has changed
                    fprintf("Parameter values for this dataset had already been estimated.\n") 
                end
                if isempty(obj.EstimatedAsymptote) && valuesFlag == 1
                   %Stop optimization until initial values have changed
                   fprintf("Optimization stopped: Please choose different initial values")
                end
            end
end