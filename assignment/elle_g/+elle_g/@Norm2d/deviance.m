        % Deviance score function
        function yax = deviance(obj, data, parameters)
            obj.Mean              = parameters(1);
            obj.StandardDeviation = parameters(2);
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(data);
        end