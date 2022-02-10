    % Norm2d  A class for the normal distribution
classdef Norm2d
    % The main properties are the mean and standard deviation ~~how to make
    % sure covariance(1, 2) matches (2, 1)
    properties
        Mean (2, 1) double {mustBeReal, mustBeFinite} ...
            = eye(2,1)
        Covariance (2, 2) double {mustBeReal, mustBeFinite, covarianceValueCheck(Covariance)} ...
            = 1.+eye(2)
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Correlation
        StandardDeviation
        ScaleFactor
        logScaleFactor
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = 0.159154943091895; %credit xavier
        Name = 'Norm2d';
    end
    
    methods (Static)
        function obj = estimate(X)
            Mean(1,1)=mean(X(1,:));
            Mean(2,1)=mean(X(2,:));
            Covariance=cov(X(1, :),X(2,:));
            obj=elle_g.Norm2d(Mean, Covariance);
        end
    end
    
    methods (Static)
        out = getData(url);
    end
    
    methods (Static)
        out = readData(file);
    end
    
    methods (Static)
        markdownOutput = report(variable);
    end
    
    methods (Static)
        test();
    end
    
    methods (Static)
        main();
    end
    
    methods (Static)
        Contents();
    end
    
    methods    
        %%% Constructor function %%%
        
        % A main constructor, for a new Norm2d
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            
            f = '     %s  %-20s= %8.4f \t %8.4f \n';
            F = '     %s  %-20s= %8.4f \t %8.4f \n \t\t\t%8.4f\t%8.4f';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , obj.Mean           );
            fprintf(F, b, 'Covariance', obj.Covariance );
            
            fprintf('\n');
            
        end
        
       
        
        
        %%% Getters and setters %%%
        
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            obj.Covariance=val;
            %update contingent properties
            obj= updateCovariance(obj);
           
        end 
        
        % Updater for covariance
       
        function obj = updateCovariance(obj)
            obj.Correlation=obj.Covariance(1,2)./(sqrt(obj.Covariance(1, 1)).*sqrt(obj.Covariance(2, 2)));
            obj.Precision=inv(obj.Covariance);
            obj.StandardDeviation=sqrt(diag(obj.Covariance));
            obj.ScaleFactor = obj.ScalingConstant/ ((sqrt(obj.Covariance(1, 1)).*sqrt(obj.Covariance(2, 2))) *  ...
                sqrt(1-obj.Correlation^2));
        end 
  
        
        
        % Setter for Mean
        function obj = set.Mean(obj, val)
            % Set the value
            obj.Mean = val;
        end
        
        %Getter for Covariance
        function val = get.Covariance(obj)
            val=obj.Covariance;
        end 
        
        %Getter for Mean
        function val = get.Mean(obj)
            val=obj.Mean;
        end
        
        %Getter for Precision
        function val = get.Precision(obj)
            val=obj.Precision;
        end
        
        %Getter for Correlation
        function val = get.Correlation(obj)
            val=obj.Correlation;
        end

    end
    
end



%validator for covariance values
function covarianceValueCheck(Covariance)
    if (Covariance(1,2) ~= Covariance(2,1))
        eidType = 'covarianceValueCheck:notcovarianceValueCheck';
        msgType = 'The covariance values row 1 col 2 and row 2 col 1 of the covariance matrix must be equal.';
        throwAsCaller(MException(eidType,msgType))
    end
end



        

        