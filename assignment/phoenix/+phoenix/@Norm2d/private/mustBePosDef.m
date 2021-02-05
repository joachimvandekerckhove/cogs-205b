%Property Validator: input matrix must be positive definite

function mustBePosDef(sigma)
   if ~(det(sigma)>0)
       eidType = "mustBePositiveDefinite:notPositiveDefinite";
       msgType = "Covariance matrix is not positive definite";
       throwAsCaller(MException(eidType,msgType))
   end
end

