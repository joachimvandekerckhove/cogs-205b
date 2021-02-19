function main
% main
% Main script for estimating bivariate distribution from online data
% Calls every other function in this package
% Without any input, will generate a bivariate distribution based on sample
% data found at a stored URL

    myDistro = Norm2d(); % Make default distribution
    url = 'http://www.cidlab.com/files/cogs205b.csv';
    data = getData(url); % Fetch data to use
    myDistro = myDistro.estimate(data); % Update distribution w/ data
    report(myDistro); % Save report of changes to file
end
