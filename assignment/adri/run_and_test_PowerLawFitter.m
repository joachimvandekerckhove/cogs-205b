%Import package
import adri.*

%Load observed data
data = toyRTdata;

%Load object f
f = PowerLawFitter(data)

% Estimate parameters for the first time
f.myFit

% Estimate parameters for a second time
f.myFit

% Keep range estimated
firstRange = f.EstimatedRange

% Change ObservedRTs
f.ObservedRT = data + 5

% Make sure that Range was reseted
f.EstimatedRange

% Estimate parameters again for these new data
f.myFit

% Obtain new Range value
f.EstimatedRange

% Compare to first one
firstRange

