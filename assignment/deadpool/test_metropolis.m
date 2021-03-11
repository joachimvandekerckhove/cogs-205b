%% Simulation to test Metropolis class
rng(1)

%% Simulate some psychometric data
truth    =  [2, 3.5];

%% Sigmoid function
pfcn     =  @(x,p) wblcdf(x,p(1),p(2)) * 0.5 + 0.5;

%% Sample size simulated data
N        =  1000;

%% Sequence of stimulus values
stimuli  =  0:5;

%% Probability as function of stimulus
prob     =  pfcn(stimuli, truth);

%% Simulated data 
correct  =  binornd(N, prob);

%% Mean of simulated data
rate     =  correct/N;

%% Log likelihood single observation
logbinopdf     =  @(c,n,p) log(binopdf(c,n,p));

%% Log likelihood function
loglikelihood  =  @(x) sum(logbinopdf(correct, N, pfcn(stimuli, x)));

% log prior density of exppdf(x,1)
logprior       =  @(x) -sum(x);   

% log Posterior density
logposterior   =  @(x) logprior(x) + loglikelihood(x);

%% Markov chain Monte Carlo
nChains = 4;

startingPoint = [ ...
    4 4
    4 2 
    2 4
    2 2]';

for c = 1:nChains
    m(c) = deadpool.Metropolis(logposterior, startingPoint(:,c));
end

tic
parfor c = 1:nChains
    t = m(c);
    t.DrawSamples(20000)
    m(c) = t;
end

% chains = cat(3,m.XHistory);