% @Norm2d - a class for the bivariate normal distribution. If no inputs are
% passed, creates a Norm2d object with mean = [0; 0] and covariance = [1
% 0.5; 0.5 1]. The first argument is the mean, which must be a real,
% finite, 2x1 vector. The second argument is the covariance, which must be
% a positive definite 2x2 matrix.
% checkData - takes a MATLAB variable. Returns a MATLAB variable
% appropriately formatted for use in subsequent functions, or throws an
% error if input is non-redeemably incorrect.
% getData - takes a (string) URL to a data file. Downloads the file to the
% pwd and outputs the name of the local file.
% main - takes no input. Generates a report file containing the mean and
% covariance of the bivariate data contained at the URL inputted to
% getData.
% readData - takes a local filename. Outputs a MATLAB variable containing
% the content of the file.
% report - takes a MATLAB variable containing the content of the URL
% inputted to getData. Outputs a Markdown-formatted text file containing
% the mean and covariance of the bivariate data at the time they were
% downloaded.
% test - takes no input. Runs a basic test suite on +mariakhoudary.