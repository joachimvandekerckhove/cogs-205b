function output = readData(fileName)
% Expects: Input is the name of a local file filename with numbers (like
% http://cidlab.com/files/cogs205b.csv), expecting two columns for two
% variables (like X and Y).
% Promises: Output is a MATLAB variable containing the content of filename.
    
    try 
        output = readmatrix( fileName )';
    catch
        ME = MException('csvData:DataCannotBeRetrieved', ...
            'The file does not exist/ is not appropriate for data retrieval.');
         throw(ME)
    end
end

