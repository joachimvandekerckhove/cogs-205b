% helpful script to get identifier for MATLAB errors
% useful when creating verifyError in test suite

try
    webread('')
catch ME
    disp('Error Message:')
    disp(ME.message)
end