classdef Wiener
    properties
        v double
        a double
        w
        tau
    end
    
    methods
        function obj = Wiener(v,a,tau,w)
            obj.v = v;
            obj.a = a;
            obj.w = w;
            obj.tau = tau;
        end
        function knl = pdf(obj,Data)
        %WEINER "three-parameter" density function that takes four parameters
        % If "t" is the data, then what to do with tau?
        accuracy = sign(Data); % get accuracy coding from +/-
        Data = Data .* accuracy; % remove negatives from RTs
        Data = Data - obj.tau; % convert reaction time to decision time
        
        knl = 1/(obj.a^2) .* exp(-obj.v .* obj.a .* obj.w - (obj.v^2 .* Data)/2) .*...
            otherFunction(0,1,Data ./ (obj.a^2),obj.w);
        end
    end
end

