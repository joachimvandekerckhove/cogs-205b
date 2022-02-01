function data = checkData(input)

% CHECKDATA checks to see if input file has appropriate properties for
% use with the Norm2d class and makes necessary adjustments for
% non-egregious inputs.

% check variable type
if string(class(input)) == 'table'
    input = table2array(input);
end

% check and adjust dimensions 
if size(input, 1) == 1 && size(input, 2) == 1
    error('Not enough data. Input must be 2xN matrix')
elseif size(input, 2) == 2 && size(input, 1) == 1
    error('Not enough data. Need more than one datapoint per variable')
elseif size(input, 2) == 2 && size(input, 1) > 1
    disp('Transposing input to 2xN...');
    data = input';
elseif size(input, 2) >= 3 && size(input, 1) > 1
    error('Too many variables. Input must contain 2 variables only.')
end
    