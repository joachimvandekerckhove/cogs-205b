%Property Validator: input matrix must be positive definite

function mustBePosDef(sigma)
   if ~(det(sigma)>0)
       eidType = "mustBePositiveDefinite:notPositiveDefinite";
       msgType = "Covariance matrix is not positive definite";
       throwAsCaller(MException(eidType,msgType))
   end
end

% I need to spend some more time learning the this type of function in the private folder.
% It is overall a learning experience for me. Incapable of detecting much
% "SMELL" for now. Your code looks pretty nice and concise in general. 
% I will continue work on it later.