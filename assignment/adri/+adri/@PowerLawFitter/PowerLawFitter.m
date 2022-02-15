classdef PowerLawFitter < handle 
    % PowerLawFitter: A class for optimizing and estimating 
    % the parameters in the Power Law of Practice.
    
    % Main property
    properties
        ObservedRT double %{mustBeReal, mustBePositive, mustBeVector}
    end
    
    % Derived properties that are not accessible to the user
    properties (SetAccess = private)
        Count;
        EstimatedAsymptote;
        EstimatedRange;
        EstimatedExposure;
        EstimatedRate;
    end
        
    % Methods
    methods

        %%% Constructor function %%%        
        % A main constructor
        function obj = PowerLawFitter(data)
            if nargin < 1                
                obj.ObservedRT = [250 586 257 615 201];            
                obj.Count = size(obj.ObservedRT,2);
                cond = "not";
                use = "default data";
            end    
            if nargin > 0                
                obj.ObservedRT = data;            
                obj.Count = size(data,2);
                cond = "";
                use = "data provided";
            end            
        end

        %%% Display function %%%
        % Print a little message to screen
        function disp(obj)
            line = repmat('-', 1, 73);
            fprintf('adri.PowerLawFitter object\n\n')
            fprintf('#%s#\n', line);
            fprintf("%7g uuu \n", obj.Count)
            %fprintf("You have specified %7g arguments", cond)
            %fprintf('  Normal |  |         | , |                  |  |\n')
            %fprintf('         \\  | %7g |   | %7g  %7g |  /\n\n', ...
            %    obj.Mean(2), obj.Covariance(2,:))
        end
              
        %%% Getters and setters %%%        
        % Setter for the Covariance Matrix
        %function set.Count(obj, val)
            % Set the value
         %   obj.Count = val;
            % Update contingent properties
            %obj = updateMatrix(obj);
        %end        
    end    
    
    % Static methods don't need the object as input
    methods (Static)
       % Estimating the mean and covariance of some data
        function ERT = expectedRT(a,b,e,beta)            
            if nargin < 1                
                a = 1;
                b = 1;
                e = 1;
                beta = 1;                
            end
            ERT = A + (B*(N+E)^(-beta));
        end

       % function getCov = estCovariance(matrix)
       %     matrix = matrix'
       %     n = size(matrix,2);            
       %     z = zeros(2,n);            
       %     barx = mean(matrix,2);
       %     for i = 1:n
       %         z(:,i) = matrix(:,i) - barx;
       %     end            
       %     getCov = 1./(n-1) .* (z * z.');
       % end





       % Estimating the mean and covariance of some data
       % function theseData = estimate(matrix)
       %     theseData = adri.Norm2d();
       %     theseMeans = theseData.estMean(matrix);
       %     theseData.Mean = theseMeans; 
       %     thisCov = theseData.estCovariance(matrix);
       %     theseData.Covariance = thisCov;
       % end

       % function getMean = estMean(matrix)            
       %     getMean = mean(matrix,1);
       % end

       % function getCov = estCovariance(matrix)
       %     matrix = matrix'
       %     n = size(matrix,2);            
       %     z = zeros(2,n);            
       %     barx = mean(matrix,2);
       %     for i = 1:n
       %         z(:,i) = matrix(:,i) - barx;
       %     end            
       %     getCov = 1./(n-1) .* (z * z.');
       % end
    end
    
end