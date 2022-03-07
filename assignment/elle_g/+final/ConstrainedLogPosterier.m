function ConLogPost = ConstrainedLogPosterier(parameter, data)
    B0b=parameter(1);
    B1b=paremeter(2);
    B0a=parameter(3);
    B1a=parameter(4);
    
    Ae=B0a;
    Am=B0a+B1a;
    Ah=B0a+2.*B1a;
    Be=B0b;
    Bm=B0b+B1b;
    Bh=B0b+2.*B1b;
    
    easy=data.easy;
    med=data.med;
    hard=data.hard;
end
