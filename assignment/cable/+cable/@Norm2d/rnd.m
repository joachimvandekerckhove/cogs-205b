function sample = rnd(Mu,Sigma,dimMat)
    % Pull a random sample from this distribution
    verifyMean(Mu);
    verifySigma(Sigma);
    verifySize(dimMat);
    % Preallocate
    sample = zeros(dimMat);
    fprintf(1,"This function isn't ready yet, sorry.\n")
    % Sample from first distribution
%             x1 = Mu(1) .* rand(size(sample(:,1)));
%             sample(:,1) = pdf(x1,Mu(1),Sigma(1));
%             % sample from second distribution
%             sample(:,2) = pdf(; % use sample(:,1), mu(2), and sigma(4)
end