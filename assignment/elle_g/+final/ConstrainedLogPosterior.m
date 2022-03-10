function ConLogPost = ConstrainedLogPosterior(parameter, data)
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
    med=data.medium;
    hard=data.hard;
    
    easyL = -wbllike([Ae, Be], easy);
    medL = -wbllike([Am, Bm], med);
    hardL = -wbllike([Ah, Bh], hard);
    logL= easyL+medL+hardL;
    
    % So in the six occurrences of Exp(), 
    % just replace x by the right A and B values and lambda by 1.  
    % Then the equation with the six Exp() in it will simplify a lot
    
    B0a=1.*exp(-1.*B0a);
    B0b=1.*exp(-1.*B0b);
    B1a=-abs(B1a);
    B1b=-abs(B1b);
    LogP=B0a+B0b+B1a+B1b;
    
    ConLogPost=logL+LogP;
end
