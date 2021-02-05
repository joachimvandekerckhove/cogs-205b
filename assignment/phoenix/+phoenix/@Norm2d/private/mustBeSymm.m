%Property Validator: input matrix must be symmetric

function mustBeSymm(sigma)
   if ~(issymmetric(sigma)==1)
       eidType = "mustBeSymmetric:notSymmetric";
       msgType = "Covariance matrix is not symmetric";
       throwAsCaller(MException(eidType,msgType))
   end
end

