% Input a bivariate data variable, then a markdown file reporting the mean and covariance of the data will be generated.

function report(data)
	filename = "JieWanHW-1.md";
	fileID = fopen(filename,'w');
	fprintf(fileID,'# Cogs205b Data Report\n');
	fprintf(fileID,['## ' date ' \n']);
	fprintf(fileID,'## Mean and Covariance of bivariate X and Y\n');
	obj = JieWanHW.Norm2d.estimate(data);
	fprintf(fileID,'- **Mean** of *X* is %5.4f\n',obj.Mean(1));
	fprintf(fileID,'- **Mean** of *Y* is %5.4f\n',obj.Mean(2));
	fprintf(fileID,'- **Covariance** of *X* and *Y* is below: <br> \n');
	fprintf(fileID,'> sigma<sub>1</sub><sup>2</sup>=%5.4f &nbsp; c<sub>12</sub>=%5.4f <br>\n',obj.Covariance(1,1),obj.Covariance(1,2));
	fprintf(fileID,'> c<sub>12</sub>=%5.4f &nbsp; sigma<sub>2</sub><sup>2</sup>=%5.4f <br>\n',obj.Covariance(2,1),obj.Covariance(2,2));
	fclose(fileID);
end