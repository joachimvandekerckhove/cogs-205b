function SatLogPost = SaturatedLogPosterior(parameter, data)
    Ae=parameter(1);
    Am=parameter(2);
    Ah=parameter(3);
    Be=parameter(4);
    Bm=parameter(5);
    Bh=parameter(6);
    
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
    
    logP=-Ae-Am-Ah-Be-Bm-Bh;
    
    SatLogPost=logL+logP;
end
