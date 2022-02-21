function ERT = Expectation(A, B, E, beta)

% EXPECTATION computes the mean expected reaction time given a asymptote A,
% range B, exposure E, and rate beta

N = obj.Count;
ERT = zeros(1, N);

for i = 1:N
    ERT(i) = A + B*(i + E)^-beta;
end