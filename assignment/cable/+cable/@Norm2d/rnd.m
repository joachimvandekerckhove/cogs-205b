function sample = rnd(obj,dimMat)
    % Pull a random sample from this distribution
    % dimMat should have two dimensions
    verifySize(dimMat);
%     fprintf(1,"This function isn't ready yet, sorry.\n")
    % Sample from first distribution
%         x1 = obj.Mean(1) .* rand([1,dimMat(1)]);
%         x2 = obj.Mean(2) .* rand([1,dimMat(2)]);
        x1 = normrnd(obj.Mean(1),obj.Covariance(1),dimMat);
    % Sample from second distribution
        sample = normrnd((obj.Mean(2) + ...
            (obj.Rho * sqrt(obj.Covariance(4))) .* ...
            (x1 - obj.Mean(1))./(sqrt(obj.Covariance(1)))),...
            (obj.Covariance(4) .* sqrt(1 - obj.Rho ^2)),dimMat);
end
