classdef Normal < Distribution
    % NORMAL  A class for the normal distribution

    % The main properties are the mean and standard deviation
    properties
        Mean double ...
            {mustBeReal, mustBeFinite} ...
            = 0
        StandardDeviation double ...
            {mustBeReal, mustBeFinite, mustBePositive} ...
            = 1
    end

    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Variance
    end

    % Class metadata
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
        Name = 'Normal';
    end


    % Methods are functions that belong to the class
    methods

        %%% Constructor function %%%

        % A main constructor, for a new Normal
        function obj = Normal(Mean, StandardDeviation)
            if nargin > 0
                obj.Mean = Mean;
            end
            if nargin > 1
                obj.StandardDeviation = StandardDeviation;
            end
            obj = updateStandardDeviation(obj);
        end

        % Disply function
        % Note this calls the superclass function with special @ syntax!
        function disp(obj)
            disp@Distribution(obj, {'Mean', 'StandardDeviation'})
        end

        %%% Getters and setters %%%

        % Setter for StandardDeviation
        function obj = set.StandardDeviation(obj, val)
            obj.StandardDeviation = val;
            obj = updateStandardDeviation(obj);
        end

        % Updater for StandardDeviation
        function obj = updateStandardDeviation(obj)
            obj.Variance  = obj.StandardDeviation^2;
            obj.Precision = 1/obj.Variance;
        end


        %%% Computation functions %%%

        % Cumulative distribution function
        function yax = cdf(obj, xax)
            zax = obj.standardize(xax);
            yax = 0.5 * (1 + erf(zax ./ sqrt(2)));
        end

        % Log Probability density function
        function yax = logPdf(obj, xax)
            yax = log(obj.ScalingConstant) ...
                - log(obj.StandardDeviation) ...
                + obj.logPdfKernel(xax);
        end

        % Probability density log kernel
        function knl = logPdfKernel(obj, xax)
            zax = obj.standardize(xax);
            knl =  -0.5 * zax.^2;
        end

        % Random number generator
        % Note this overrides the superclass method!
        function x = rnd(obj, dims)
            x = obj.unstandardize(randn(dims));
        end

        % Inverse cumulative distribution function
        function xax = inverseCdf(obj, yax)
            xax = norminv(yax, obj.Mean, obj.StandardDeviation);
        end

        % Standardize a variate
        function z = standardize(obj, x)
            z = (x - obj.Mean) ./ obj.StandardDeviation;
        end

        % Unstandardize a variate
        function x = unstandardize(obj, z)
            x = obj.Mean + z * obj.StandardDeviation;
        end

        % These are handled by the superclass now

        % % Probability density function
        % function yax = pdf(obj, xax)
        %     yax = obj.ScalingConstant ...
        %         / obj.StandardDeviation ...
        %         * pdfKernel(obj, xax);
        % end

        % % Probability density kernel
        % function knl = pdfKernel(obj, xax)
        %     knl = exp(logPdfKernel(obj, xax));
        % end

        % % Deviance score function
        % function yax = deviance(obj, data)
        %     yax = -2 * sum(obj.logPdf(data));
        % end

        % Integrate a function over this distribution
        function A = integrateOver(obj, fcn)

            w = [ ...
                2.22939E-13  4.39934E-10  1.08607E-7   7.80256E-6  ...
                2.28339E-4   0.00324377   0.0248105    0.109017    ...
                0.286676     0.462244     0.462244     0.286676    ...
                0.109017     0.0248105    0.00324377   2.28339E-4  ...
                7.80256E-6   1.08607E-7   4.39934E-10  2.22939E-13 ];

            x = [ ...
                -5.38748  -4.60368  -3.94476  -3.34785  -2.78881  ...
                -2.25497  -1.73854  -1.23408  -0.73747  -0.24534  ...
                 0.24534   0.73747   1.23408   1.73854   2.25497  ....
                 2.78881   3.34785   3.94476   4.60368   5.38748  ];

            A = sum( ...
                fcn(x * sqrt(2) * obj.StandardDeviation + obj.Mean) ...
                ./ sqrt(pi) .* w ...
                );

        end

    end
    
end
