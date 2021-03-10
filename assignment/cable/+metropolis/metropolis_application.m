%% Markov Chain Monte Carlo
% Certainly the most popular Monte Carlo algorithm is Markov chain Monte
% Carlo (MCMC).  MCMC is a method of drawing samples from a gradually
% changing distribution.  At each point, the distribution isn't quite
% right, but over many samples it is.  There are many variations on MCMC.
% We will focus on a simple one called _Metropolis sampling._
%
%% Likelihood functions
% Throughout, the distribution from which we want to sample will be a
% probability distribution over some unknown quantity.  We want to know,
% for example, the probability that some *X* is greater than 0.
%
%% Metropolis
%
%% Markov Chain Monte Carlo (MCMC) simulation
clear
close all
rng(1)

%% Simulate some psychometric data

truth    =  [2, 3.5];

fprintf(' > truth:     (%.1f, %.1f)\n', truth)

pfcn     =  @(x,p) wblcdf(x,p(1),p(2)) * 0.5 + 0.5;

N        =  1000;
stimuli  =  0:5;
prob     =  pfcn(stimuli, truth);

correct  =  binornd(N, prob);
rate     =  correct/N;

se       =  sqrt((rate .* (1 - rate))./N);

xax      =  linspace(0, 5, 101);
yax      =  pfcn(xax, truth);

subplot(3, 3, [1:2 4:5])
plot(xax, yax, 'b-', ...
    stimuli, rate, 'ro', ...
    'linewidth', 2, ...
    'clipping', 'off', ...
    'markerfacecolor', 'w')
ylim([.5 1])


line([stimuli; stimuli], rate + 1.96 * [se; -se], -[correct; correct], ...
    'linew', 2, 'color', 'r')

f1 = gcf();
drawnow


%% Set up likelihood, prior, and posterior

logbinopdf     =  @(c,n,p) log(binopdf(c,n,p));

loglikelihood  =  @(x) sum(logbinopdf(correct, N, pfcn(stimuli, x)));

deviance       =  @(x) -2 * loglikelihood(x);

startingPoint  =  [4, 4]';

guess          =  fminsearch(deviance, startingPoint);

fprintf(' > guess:     (%.1f, %.1f)\n', guess)

logprior       =  @(x) -sum(x);   % log of exppdf(x,1)

logposterior   =  @(x) logprior(x) + loglikelihood(x);  % without scaling


%% Markov chain Monte Carlo

nChains = 4;

startingPoint = [ ...
    4 4
    4 2 
    2 4
    2 2]';

for c = 1:nChains
    m(c) = Metropolis(logposterior, startingPoint(:,c));
end

tic
parfor c = 1:nChains
    t = m(c);
    t.DrawSamples(20000)
    m(c) = t;
end

chains = cat(3,m.XHistory);
toc

%% More figures

A = squeeze(chains(5002:end,1,:));
B = squeeze(chains(5002:end,2,:));

estimate = mean([A(:) B(:)]);
post_std = std([A(:) B(:)]);
fprintf(' > estimate:  (%.1f, %.1f) +/- (%.2f, %.2f)\n', estimate, post_std)

subplot(3,3,3), plot(A, B, '.');

subplot(3,3,7), plot(A); 
subplot(3,3,8), plot(B); 

subplot(3,3,6), histogram(A, 51, 'edgecolor', 'none')
subplot(3,3,9), histogram(B, 51, 'edgecolor', 'none')

subplot(3, 3, [1:2 4:5])

line(xax, pfcn(xax, estimate), ...
    'linestyle', '--', ...
    'color', [1 .5 0], ...
    'linewidth', 2, ...
    'clipping', 'off')



%%   Deriving Bayesian credible intervals for model parameters

fprintf(' > Parameter A is between %.2f and %.2f.\n', ...
    prctile(A(:), [0.025 0.975]*100))
fprintf(' > Parameter B is between %.2f and %.2f.\n', ...
    prctile(B(:), [0.025 0.975]*100))


