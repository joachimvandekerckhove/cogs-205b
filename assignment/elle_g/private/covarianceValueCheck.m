      %validator for covariance values
        function covarianceValueCheck(Covariance)
            [~,bool] = chol(Covariance);
            if bool == 1 || ~(Covariance(1,2) == Covariance(2,1))
                % cholesky factorization checks for positive definite and symmetry
                eidType = 'covarianceValueCheck:notcovarianceValueCheck';
                msgType = 'The covariance values row 1 col 2 and row 2 col 1 of the covariance matrix must be equal.';
                throwAsCaller(MException(eidType,msgType))
            end
        end
        