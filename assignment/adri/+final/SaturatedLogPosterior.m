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
    % Matlab Exppdf() function computes the pdf of the exp. distribution
    priorAe = exppdf(A_e,1);
    priorAm = exppdf(A_m,1);
    priorAh = exppdf(A_h,1);
    priorBe = exppdf(B_e,1);
    priorBm = exppdf(B_m,1);
    priorBh = exppdf(B_h,1);
    logPrior = log(priorAe) + log(priorAm) + log(priorAh) + ...
               log(priorBe) + log(priorBm) + log(priorBh);
    % Calculate logPosterior
    logPosterior = logLikelihood + logPrior;
    
    % DEFINE OUTPUT
    satLogPosterior = logPosterior;

end