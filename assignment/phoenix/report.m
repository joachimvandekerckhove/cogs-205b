% Generate a report outputting BVN stats for data
% Input: bivariate data matrix
% out: .md formatted report

function report(mtx)
	sampleStats = phoenix.Norm2d().estimate(mtx);
	if isfile("phoenix-1.md")
		warning("A report with the same name already exists! It will be overwritten.")
	end
	out = "phoenix-1.md";
	
	% Write Report
	fileID = fopen(out, 'w');
	fprintf(fileID, "Summary report for Bivariate Normal Data, printed on # %s  #\n\n\n", datestr(now));
	fprintf(fileID, "Input data had %d observations for each variable. Their sample statistics are as follows:\n", size(mtx,2));
	fprintf(fileID, "\tMean = [%.2f, %.2f]\n", sampleStats.Mean(1),sampleStats.Mean(2));     	
	fprintf(fileID, "\tCovariance Matrix = [%.2f %.2f; %.2f %.2f]\n", sampleStats.Covariance(1,1),...
			 sampleStats.Covariance(1,2),sampleStats.Covariance(2,1),sampleStats.Covariance(2,2));
	fprintf(fileID, "\tPearson Correlation = %.2f\n", sampleStats.Correlation);
	fclose(fileID);

	%fprintf("Report generated.\n")
	
end
