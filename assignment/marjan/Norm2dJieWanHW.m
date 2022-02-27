classdef Norm2dJieWanHW
	
	properties
		Mean(2,1) double {mustBeReal, mustBeFinite} = [0; 0] %, mustBeSizeMean
		Covariance(2,2) double {mustBeReal, mustBeFinite, mustBePositiveZero, mustBeSym} = [2, 1; 1, 3]
	end

	properties	(SetAccess = private)
        Precision
        Std
        Correlation
	end


	methods        
        %%% Constructor function %%%
        
        % A main constructor, for a new Normal
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for StandardDeviation
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end

	    %%% Getters and setters %%%
        
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end
        
        % Updater for Covariance
        function obj = updateCovariance(obj)
            obj.Precision  = inv(obj.Covariance);
            obj.Std = ones(1,2);
            obj.Std(1) = sqrt(obj.Covariance(1,1));
            obj.Std(2) = sqrt(obj.Covariance(2,2));
            obj.Correlation = obj.Covariance(1,2)/(obj.Std(1)*obj.Std(2));
        end

    end

    methods
    	
        function zpdf = z4pdf(obj,xax)     %could be simplified to two lines of code by getting logkernel:
            A = standardize(obj,xax,1).^2; %k = logkernel(obj, xax);
            B = 2 * obj.Correlation;       %zpdf = obj.logScaleFactor + k;
            C = standardize(obj,xax,1);
            D = standardize(obj,xax,2);
            E = standardize(obj,xax,2).^2;
            zpdf = A - B .* C .* D + E;
        end

        function zstan = standardize(obj,xax,i)
            zstan = (xax(i,:) - obj.Mean(i)) ./ obj.Std(i);
        end

    	%yax = pdf(obj, xax) %signiture?

    end
    %cdf and log cdf functions are missed

    %My solution for this part:

    %function out=cdf(obj,X,Mu,Sigma)
           %out= mvncdf(X,Mu,Sigma);%Mu row vector
        %end

       % function out=logcdf(obj,X,Mu,Sigma)
           %p= mvncdf(X,Mu,Sigma);%Mu row vector
           %out=log(p)
       % end


	methods (Static)
        
        function x = unstandardize(Average,z,Std)
            x = Average + z .* Std;
        end

        testSuite()
        
    end

end
%Deviance function is missed
%my solution for this part:
%function out=dev(obj,Data,Mu,Sigma)
            
            %obj=obj.setMeanAndCovariance(Mu,Sigma)
            %allLogs=obj.logpdf(Data)
            %sum1=sum(allLogs)
            %out=-2*sum1
        %end


function mustBeSym(A)    
    if ~(A(1,2)==A(2,1))
        throwAsCaller(createValidatorException('MATLAB:validators:mustBeSym'));
    end
end

function mustBePositiveZero(A)    
    if ~((A(1,1)>0) && (A(2,2)>0) && (A(1,2)>=0) && (A(2,1)>=0))
        throwAsCaller(createValidatorException('MATLAB:validators:mustBePostiveZero'));
    end
end

% function mustBeSizeMean(A)    
%     if ~(size(A)==[2 1])
%         throwAsCaller(createValidatorException('MATLAB:validators:mustBeSizeMean'));
%     end
% end