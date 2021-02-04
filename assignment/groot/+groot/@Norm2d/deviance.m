function dev = deviance(obj, data)
    % DEV Calculate deviance (summed logpdf of all points in xax)
    % Takes data which is a N x 2 matrix 
    
% check shape of input parameter xax
validateattributes(data,{'numeric'}, {'ndims',2,'nrows',2});

% Norm2d.logpdf takes 2xN matrix
dev = -2 * sum(obj.logpdf( data ));
end