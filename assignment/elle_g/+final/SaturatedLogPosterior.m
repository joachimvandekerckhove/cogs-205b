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
    % lambda * e ^(-lambda * x)
    
    lp_Ae=1.*exp(-1.*Ae);
    lp_Am=1.*exp(-1.*Am);
    lp_Ah=1.*exp(-1.*Ah);
    lp_Be=1.*exp(-1.*Be);
    lp_Bm=1.*exp(-1.*Bm);
    lp_Bh=1.*exp(-1.*Bh);
    
    logP=lp_Ae+lp_Am+lp_Ah+lp_Be+lp_Bm+lp_Bh;
    
    SatLogPost=logL+logP;
end
