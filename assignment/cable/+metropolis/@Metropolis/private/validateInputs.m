function validateInputs(obj)
    % Attempt to evaluate the target function at the initial values
    % If this does not work, 
    try
        obj.TargetLogPdf(obj.InitialValues);
    catch
        error(['Initial Values (input 2) do not work with LogPDF (input 1).'...
            'Please use initial values that the function can evaluate.']);
    end
end