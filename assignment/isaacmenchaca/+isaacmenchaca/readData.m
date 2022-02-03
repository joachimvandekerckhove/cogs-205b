function output = readData(fileName)
% Expects: Input is the name of a local file filename with numbers expecting two columns for variables (e.g. X and Y). Promises: Output is a MATLAB variable containing the content of filename.
    
    try 
        output = readmatrix( fileName )';
    catch
        ME = MException('csvData:DataCannotBeRetrieved', ...
            'The file does not exist/ is not appropriate for data retrieval.');
         throw(ME)
    end
end

