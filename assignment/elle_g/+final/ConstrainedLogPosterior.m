function ConLogPost = ConstrainedLogPosterior(parameter, data)
    B0a=parameter(1);
    B1a=parameter(2);
    B0b=parameter(3);
    B1b=parameter(4);
    
    Ae=B0a;
    Be=B0b;
    Am=B0a+B1a;
    Bm=B0b+B1b;
    Ah=B0a+2.*B1a;
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
    % lambda * e ^(-lambda * x) = 1 * e ^(-1 * x) = -x
    % Laplace(x|a,b) long story short = -log(2)-|x| 
    % ignore the -log(2) ... sooooo it = -|x|

    LogP=-B0a-B0b-abs(B1a)-abs(B1b);
    
    ConLogPost=logL+LogP;
end
