% Computed the expected mean RT
function ERT = expectedRT(obj,A,B,E,beta)            
    N = 1:size(obj.ObservedRT,2);
    ERT = A + (B*(N+E).^(-beta));
end