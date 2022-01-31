function report(data)

% report(data) takes a variable containing a 2xN bivariate (X and Y) data
% and produces a file, formatted in Markdown, that presents the mean and
% covariance of the data for hooman-consumption. 

% for troubleshooting
% if nargin < 1
%     data = angela.readData('cogs205b.csv');
% end

% check if data is a 2xN
if size(data,1) ~= 2
    data = data';
end

% make an object
this = angela.Norm2d.estimate(data);

% make a cell?
myCell = {'Data parameters', ...
          sprintf('date: %s',datestr(now)),...
          sprintf('The means are %f and %f',this.Mean(1),this.Mean(2)),...
          sprintf('The covariance matrix is:\n %f\t %f\n %f\t %f', ...
                this.Covariance(1),this.Covariance(2),this.Covariance(3), ...
                this.Covariance(4)),...
          sprintf('The correlation is %f',this.Correlation)};

% file output
mdfileName = "angela-" + datestr(now,'yy-mm-dd-HHMM') + ".md";
fid = fopen(mdfileName,'w');
for ii = 1:size(myCell)
    fprintf(fid, '%s\n',myCell{ii,:}) ;
end

end
