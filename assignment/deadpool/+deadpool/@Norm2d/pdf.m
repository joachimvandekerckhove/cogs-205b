function dF = pdf(obj,xax)
% Validate properties of the point xax
    if ~(size(xax,1)==2)
        error('Support must have size of 2.')
    end

    if ~(isfinite(xax))
        error('Support must be a finite value.')
    end

    if ~(isreal(xax))
        error('Support must be a real vector.')
    end

    npoints = size(xax,2)
    detertminant = det(obj.CovM)
    invsqrtdet = (detertminant).^(-0.5)
    knl = zeros(npoints,1)
    dF = zeros(npoints,1)

    for i = 1:npoints
%Obtain pdf at the point xax
        krnl(i) = exp(-0.5*((xax(:,i) - obj.Mean).' * obj.PrecisionM * (xax(:,i) - obj.Mean)))
        dF(i) = obj.scalingconstant*invsqrtdet*krnl(i)    
    end
end