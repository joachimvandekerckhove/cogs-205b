function yax = deviance(obj, xax)
    lpdf = logpdf(obj, xax);
    yax = sum(lpdf)*(-2);
end