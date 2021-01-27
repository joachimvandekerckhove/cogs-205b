function obj = updatePresCorM(obj)
%Updated the Precision Matrix and Correlation after a change in CovM
obj.PrecisionM = inv(obj.CovM)
obj.Correlation = obj.CovM(2,1) ./ (obj.CovM(1,1)*obj.CovM(2,2))
end