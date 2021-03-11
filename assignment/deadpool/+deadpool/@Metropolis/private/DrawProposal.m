function DrawProposal(obj)
%DrawProposal - add Normal noise to previous value

    % Draw an XDim standard normal column vector
    z = normrnd( 0 , obj.TransitionStd , [obj.XDim , 1] );

    % Add standard gaussian noise to previous point to generate proposal
    obj.PointX = obj.XHistory( : , obj.StepCount) + z;
end