classdef powerlawfitter <handle 
    properties
        ObservedRT (1,:) double{mustBeReal, mustBeFinite, mustBePositive}=[313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263 ]
        Count (1,1)double{mustBeReal, mustBeFinite}=25
    end
properties(SetAccess=private)
    EstimatedAsymptote double{mustBeReal, mustBeFinite}
    EstimatedRange double{mustBeReal}
    EstimatedExposure double{mustBeReal}
    EstimatedRate double{mustBeReal}
    Isfitvalid=false
    Loss
end
methods
   %%Constructor function%%
    function obj=powerlawfitter(ObservedRT)
        if nargin > 0
            obj.ObservedRT = ObservedRT;
            obj.Count = size(ObservedRT,2);
        end
    end

        
    function ERT=Expectation(obj,A,B,E,beta)
%         A=obj.EstimatedAsymptote
%         B=obj. EstimatedRange
%         E=obj.EstimatedExposure
%         beta=obj.EstimatedRate
        N=obj.Count;
        ERT=zeros(1,N);
        
        for i =1:N
        ERT(i)=A+B*(i+E).^(-beta);
        end
    end
    
    function SSE=SumofSquaredError(obj,parameters)
        if nargin < 2
           parameters = [300,200,2,2];
        end

        A       = parameters(1);
        B       = parameters(2);
        E       = parameters(3);
        beta    = parameters(4);

        ERT=obj.Expectation(A,B,E,beta);
        SSE=sum((ERT-obj.ObservedRT).^2);
    end

    

    function printAll(obj)
    fprintf('The number of the trials are %d. \n', obj.Count)

    if obj.Isfitvalid==true
    fprintf('The estimated EstimatedAsymptote in our model is %d. \n', obj.EstimatedAsymptote)
    fprintf('The estimated EstimatedRange in our model is %d. \n', obj.EstimatedRange)
    fprintf('The estimated EstimatedExposure in our model is %d. \n', obj.EstimatedExposure)
    fprintf('The estimated EstimatedRate in our model is %d. \n', obj.EstimatedRate)
    fprintf('The estimated Loss in our model is %d. \n', obj.Loss)
    else
        fprintf('No estimate available');
    end
end

% Setter and Getters
function set.ObservedRT(obj,newData)
    if isequal(obj.ObservedRT,newData)
        
    else
        obj.ObservedRT=newData;
        obj.Count=size(newData,2); %#ok<MCSUP> 
        obj.Isfitvalid=false; %#ok<MCSUP> 

    end

end

function set.Count(obj,~)
%     fprintf('You cannot set the Count! ');
    obj.Count=size(obj.ObservedRT,2); %#ok<MCSUP> 
end
    
    %optimization
function fit(obj)

        if obj.Isfitvalid==false
        startValue=[300,200, 2, 2];
        objectiveFunction=@(parameters)(SumofSquaredError(obj,parameters));
        options = optimset('MaxFunEvals', 1e5, 'MaxIter', 1e6);
        sol=fminsearch(objectiveFunction,startValue,options);

        obj.EstimatedAsymptote = sol(1);
        obj.EstimatedRange = sol(2);
        obj.EstimatedExposure = sol(3);
        obj.EstimatedRate = sol(4);

        obj.Loss = SumofSquaredError(obj,sol);

        obj.Isfitvalid=true;
        else
            fprintf("Parameters are already estimated")
        end
end

end %Method End
end %class End
