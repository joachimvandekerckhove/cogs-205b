function norm2dObj = estimate(X)
%ESTIMATE Takes 2xN matrix and output Norm2d object
%   Input : X - 2xN matrix that is sufficiently large
%   Output: norm2dObj - Norm2d object with mean and covariance estimated
%   from input 

    arguments 
        X (2,:)
    end
    
    meanX = mean(X, 2); % mean of each row
    stdX = cov(X(:,1),X(:,2)); 
    
    norm2dObj = groot.Norm2d(meanX, stdX);

end

