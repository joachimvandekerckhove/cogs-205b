classdef getFinalData

    properties (SetAccess = private)
        easy
        medium
        hard
    end

    properties (SetAccess = private, GetAccess = private, Hidden)
        n = 512
    end

    properties (SetAccess = private, Hidden)
        simulationValues
        parameterSet = 1
    end

    methods
        function disp(obj)
            fprintf('  data set with conditions:\n\n');
            fprintf('      "easy": [%ix1] %s\n', obj.n, class(obj.easy));
            fprintf('    "medium": [%ix1] %s\n', obj.n, class(obj.medium));
            fprintf('      "hard": [%ix1] %s\n\n', obj.n, class(obj.hard));
        end
    end
    
    methods
        function obj = getFinalData()

            switch obj.parameterSet
                case 1
                    M = 0.8;  S = 0.8;  N = 3.0;  T =-0.5;
                case 2
                    M = 1.6;  S = 0.0;  N = 3.0;  T =-0.5;
                case 3
                    M = 2.4;  S =-0.8;  N = 3.0;  T =-0.5;
                case 4
                    M = 0.8;  S = 0.8;  N = 2.5;  T = 0.0;
                case 5
                    M = 1.6;  S = 0.0;  N = 2.5;  T = 0.0;
                case 6
                    M = 2.4;  S =-0.8;  N = 2.5;  T = 0.0;
                case 7
                    M = 0.8;  S = 0.8;  N = 2.0;  T = 0.5;
                case 8
                    M = 1.6;  S = 0.0;  N = 2.0;  T = 0.5;
                case {0, 9}
                    M = 2.4;  S =-0.8;  N = 2.0;  T = 0.5;
            end

            obj.simulationValues = [M S N T];

            rng(0)

            data = struct( ...
                'easy'   , wblrnd(M + 0*S, N + 0*T, [obj.n 1]), ...
                'medium' , wblrnd(M + 1*S, N + 1*T, [obj.n 1]), ...
                'hard'   , wblrnd(M + 2*S, N + 2*T, [obj.n 1])  ...
                );
            
            obj.easy   = data.easy;
            obj.medium = data.medium;
            obj.hard   = data.hard;

        end
    end
end