function ERT = Expectation(obj, parameters)

% EXPECTATION computes the mean expected reaction time given a vector
% parameters [asymptote A, range B, exposure E, rate Beta]

A = parameters(1);
B = parameters(2);
E = parameters(3);
beta = parameters(4);
N = obj.Count;
ERT = zeros(1, N);

for i = 1:N
    ERT(i) = A + B*(i + E).^-beta;
end
end