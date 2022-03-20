% Compute the log-posterior for the Constrained model.
function constLogPosterior = ConstrainedLogPosterior(parameter,data)

    % LOAD AND ARRANGE THE INPUT
    % Load free parameters
    B0A = parameter(1);
    B1A = parameter(2);
    B0B = parameter(3);
    B1B = parameter(4);
    % Scale parameters per condition
    A_e = B0A;
    A_m = B0A + B1A; 
    A_h = B0A + 2*B1A; 
    % Shape parameters per condition
    B_e = B0B;
    B_m = B0B + B1B; 
    B_h = B0B + 2*B1B; 
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
    % Parameters B0A and B0B have an Exponential prior with lambda = 1
    % [lambda*e^(-lambda*x) = 1*e^(-1*x) = e^(-x)], so that 
    % log(Exp[parameter|lambda=1]) = log(e^(-parameter)) = -parameter
    logPriorB0A = -B0A;
    logPriorB0B = -B0B;
    % Parameters B1A and B1B have a Laplace prior with a = 0 and b = 1,
    % [(1/2b)*e^(-((|x-a|)/(b)) = (1/2(1))*e^(-((|x-0|)/(1)) = ...
    % = (1/2)*e^(-|x|)], if we ignore the additive constant, we have :
    % log(Laplace[parameter|a=0,b=1]) = log(e^(-|x|)) = -|x|
    logPriorB1A = -(abs(B1A)); 
    logPriorB1B = -(abs(B1B));    
    logPrior = logPriorB0A + logPriorB0B + logPriorB1A + logPriorB1B;

    % Calculate logPosterior
    logPosterior = logLikelihood + logPrior;
    
    % DEFINE OUTPUT
    constLogPosterior = logPosterior;

end