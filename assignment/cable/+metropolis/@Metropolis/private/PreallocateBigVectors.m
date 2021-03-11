function obj = PreallocateBigVectors(obj)
% Perform computationally expensive tasks now to speed up code 
% Sets up empty vectors for History, to index into
% Generates random numbers now to use inside the for loop later
    
    % Save initial values added during construction
%     tempX = obj.XHistory;
%     tempY = obj.YHistory;
    % Preallocate based on number of samples to draw
    obj.XHistory = zeros(obj.XDim,obj.numSamples);
    obj.YHistory = zeros(1,obj.numSamples);
    obj.randList = randn(obj.XDim,obj.numSamples); % normal rand
    obj.randList(obj.XDim+1,:) = rand(1,obj.numSamples); % unif rand
    % Put initial values back in
%     obj.XHistory(:,1) = tempX;
%     obj.YHistory(1) = tempY;
end