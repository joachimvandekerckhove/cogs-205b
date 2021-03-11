classdef (Abstract) Node
% Node  An abstract class for nodes in a DAG

    % The main properties
    properties
        Data double
    end
    
    % Abstract methods must be implemented by children of the class
    methods (Abstract)
        logPdf(obj, xValue)
        logPdfKernel(obj, xValue)
    end
    
end
