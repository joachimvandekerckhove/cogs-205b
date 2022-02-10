function main()
% Expects: No input. Promises: Generates a report file named isaacmenchaca-1.md that contains the mean and covariance of the bivariate data that are contained in http://cidlab.com/files/cogs205b.csv.

    url = "http://cidlab.com/files/cogs205b.csv";
    downloadedFilePath = isaacmenchaca.getData(url);
    
    bivarData = isaacmenchaca.readData(downloadedFilePath);
    
    
    isaacmenchaca.report(bivarData);
    
    
end

