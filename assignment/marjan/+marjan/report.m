% report.
% This function reports the properties Of the dataset,
% including the size of the dataset, the mean and covariance of the
% bivariate normal distribution 
function [] = report(data)
    n=size(data,1);
    if n~=2
        data=data';
    end
    txt = sprintf('There are %d samples in the dataset.',n);
    disp(txt); %#ok<DSPS> 


% for i=1:n
%     txt = sprintf('%d- x= %f y= %f',i, data(i,:));
%     disp(txt)
% end

b=marjan.Norm2d.estimate(data);
sprintf("The means of the dataset are %f and %f", b.Mean(1), b.Mean(2) )
sprintf("The covariance matrix of the dataset is:\n %f\t %f\n %f\t %f", b.Covariance(1), b.Covariance(2), b.Covariance(3), b.Covariance(4))
sprintf("The correlation of the dataset is %f", b.Correlation)

fileID=fopen("report.markdown", 'w');
fprintf(fileID,"This report is created at this date and time:%s\n", datestr(now));
fprintf(fileID, "The means of the dataset are %f and %f\n", b.Mean(1), b.Mean(2));
fprintf(fileID,"The covariance matrix of the dataset is:\n %f\t %f\n %f\t %f\n", b.Covariance(1), b.Covariance(2), b.Covariance(3), b.Covariance(4));
fprintf(fileID,"The correlation of the dataset is %f\n", b.Correlation);
fclose (fileID);

end
