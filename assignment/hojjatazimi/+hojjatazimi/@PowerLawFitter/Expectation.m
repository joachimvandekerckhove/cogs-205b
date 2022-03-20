function ERT = Expectation(obj, A, B, E, b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ERT = zeros(1, obj.Count);
for t = 1 : obj.Count
    ERT(t) = A + B * power(t+E, -b);
end
end