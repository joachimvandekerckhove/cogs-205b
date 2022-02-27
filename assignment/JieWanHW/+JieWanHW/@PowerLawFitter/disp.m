function disp(obj)
    fprintf('Dataset information:\n')
    fprintf('(1) The dataset has %d number of trials.\n',obj.Count)
    fprintf('(2) The estimated Asymptote A of this dataset is %d.\n',obj.EstimatedAsymptote)
    fprintf('(3) The estimated Range B of this dataset is %d.\n',obj.EstimatedRange)
    fprintf('(4) The estimated Exposure E of this dataset is %d.\n',obj.EstimatedExposure)
    fprintf('(5) The estimated Rate beta of this dataset is %d.\n',obj.EstimatedRate)
%    fprintf('(6) The SSE/Loss of this dataset is
%    %d.\n',SumOfSquaredError(obj)) % series of SSEs
%     fprintf('magneto.Norm2d object\n\n')
%     fprintf('         /  | %7g |   | %7g  %7g |  \\\n', obj.Mean(1), obj.Covariance(1,:))
%     fprintf('  Normal |  |         | , |                  |  |\n')
%     fprintf('         \\  | %7g |   | %7g  %7g |  /\n\n', ...
%         obj.Mean(2), obj.Covariance(2,:))
end