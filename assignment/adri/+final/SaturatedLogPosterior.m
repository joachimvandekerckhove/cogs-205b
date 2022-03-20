% Compute the log-posterior for the Saturated model.
function satLogPosterior = SaturatedLogPosterior(parameter,data)
    
    % LOAD AND ARRANGE THE INPUT
    % Scale parameters per condition
    A_e = parameter(1);
    A_m = parameter(2); 
    A_h = parameter(3);
    % Shape parameters per condition
    B_e = parameter(4);
    B_m = parameter(5);
    B_h = parameter(6);
    % Distinguish among conditions
    dataEasy = data.easy;
    dataMedium = data.medium;
    dataHard = data.hard;

    % COMPUTE SATURATED LOG POSTERIOR
    % Matlab's Wbllike() function computes the negative log-likelihood
    % for the Weibull distribution. We use this function!
    logLik_e = -wbllike([A_e, B_e],dataEasy);
    logLik_m = -wbllike([A_m, B_m],dataMedium);
    logLik_h = -wbllike([A_h, B_h],dataHard);
    logLikelihood = logLik_e + logLik_m + logLik_h;
    % All parameters have an Exponential prior (lambda*e^(-lambda*x))
    % with lambda = 1 (1*e^(-1*x) = e^(-x), so that 
    % log(Exp[parameter|lambda=1]) = log(e^(-parameter)) = -parameter
    logPriorAe = -A_e;
    logPriorAm = -A_m;
    logPriorAh = -A_h;
    logPriorBe = -B_e;
    logPriorBm = -B_m;
    logPriorBh = -B_h;
    logPrior = logPriorAe + logPriorAm + logPriorAh + ...
               logPriorBe + logPriorBm + logPriorBh;
    % Calculate logPosterior
    logPosterior = logLikelihood + logPrior;
    
    % DEFINE OUTPUT
    satLogPosterior = logPosterior;

end