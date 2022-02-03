function report(input)

% REPORT generates a Markdown file with summary statistics for input, which
% should be a bivariate Matlab variable

% compute stats
mean1 = mean(input(1,:));
mean2 = mean(input(2,:));
Mean = vertcat(mean1, mean2);
Covariance = cov(input(1,:), input(2,:));

% write to text file
fid = fopen('mariakhoudary-1.md', 'w');
fprintf(fid, '%% *Summary statistics* \n Time of computation: %s', datetime());
fprintf(fid, '\n\n %s %.4f \n\t\t\t\t %.4f \n' , '* Mean = ', Mean);
fprintf(fid, '\n%s%.4f   %.4f\n\t\t\t\t\t\t %.4f   %.4f\n\t\t\t\t\t\t' , '* Covariance = ', Covariance');
fclose(fid);

