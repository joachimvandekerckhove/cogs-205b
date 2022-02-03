function report(X)
% Produces a file (.md) that presents the mean and covariance of the data

meanReport = kenwat1.Norm2d().estimate(X).Mean;
covarianceReport = kenwat1.Norm2d().estimate(X).Covariance;
correlationReport = kenwat1.Norm2d().estimate(X).Correlation;

fid = fopen('kenwat1-1.md','w');
fprintf(fid,'Basic info of the behavioral data\n');
fprintf(fid,'Report created: %s\n\n',datetime);
fprintf(fid,'* Mean of the data is:\n');
fprintf(fid, [repmat('%0.4f', 1, size(meanReport,2)) '\n'], meanReport');
fprintf(fid,'* Covariance of the data is:\n');
fprintf(fid, [repmat('%0.4f\t', 1, size(covarianceReport,2)) '\n'], covarianceReport');
fprintf(fid,'* Correlation of the data is:\n');
fprintf(fid, '%0.4f',correlationReport');
fclose(fid);

end

