function dic=DIC(obj)

% Computes the approximated DIC of the model

           % error('Not yet implemented')
[~, CleanSampleY, ~] = CleanHistory(obj);
M=mean(-2*(CleanSampleY));
Variance=var(-2*(CleanSampleY));
dic=M+Variance/2;
          
end