classdef Normal2d
% A class for the 2 dimentional multivariate normal distribution
    properties 
        Mean(2,1) double {mustBeReal,mustBeFinite} = (0,0)
        CovM(2,2) double {mustBeFinite,mustBePositiveSemiDef(CovM),mustBeSimm(CovM)} = eye(2) 
    end

end