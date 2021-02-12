function dev = deviance(obj, data)
    % DEV Calculate deviance (summed logpdf of all points in xax)
    % Input: 2xn data matrix. Output: 1x1 
    
% check shape of input parameter xax
validateattributes(data,{'numeric'}, {'ndims',2,'nrows',2});

% Norm2d.logpdf takes 2xN matrix
dev = -2 * sum(obj.logpdf( data ));
end
