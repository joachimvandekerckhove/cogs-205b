function test_estimate()
%TEST_ESTIMATE Summary of this function goes here
%   Detailed explanation goes here
    correct_input = randn(2, 10);
    correct_mean = mean(correct_input, 2);
    correct_cov = cov(correct_input');
    try
        out = hojjatazimi.Norm2d.estimate(correct_input);
        if out.Mean == correct_mean 
            if out.Covariance == correct_cov
                disp('correct output')
            end
        else
            correct_out = hojjatazimi.Norm2d(correct_mean, correct_cov);
            disp('expected:')
            disp(correct_out)
            disp('recieved:')
            disp(out)
            error('Wrong Answer!')
        end
    catch
        wrong_analysis(correct_input)
    end


    false_input = randn(3, 10)
    try
        out = hojjatazimi.Norm2d.estimate(false_input);
        wrong_analysis(false_input)
    catch
        disp('error in input was detected succesfuly!')
    end
disp('Estimate Works Perfect!')
end

function wrong_analysis(input)
        disp('input was:')
        disp(input)
        error('wrong analysis of the input')
end

