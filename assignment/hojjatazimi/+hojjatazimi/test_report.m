function test_report()
%TEST_REPORT Summary of this function goes here
%   Detailed explanation goes here
invalid_input_1 = 5;
invalid_input_2.X = 2;
invalid_input_3.Y = 10;
invalid_input_4.X = [1 2 3];
invalid_input_4.Y = [1 2 3 4 5];
invalid_input_5.X = randn(3, 4);
invalid_input_5.Y = [1 2 3 4 5];
invalid_input_6.X = randn(1, 4);
invalid_input_6.Y = randn(6, 8);

check_bad(invalid_input_1, "no struct not detected")
check_bad(invalid_input_2, "no Y not detected")
check_bad(invalid_input_3, "no X not detected")
check_bad(invalid_input_4, "dif size not detected")
check_bad(invalid_input_5, "2d X not detected")
check_bad(invalid_input_6, "2d Y not detected")

valid_input.X = randn(1, 10);
valid_input.Y = randn(1, 10);

try
    hojjatazimi.report(valid_input)
    disp('passed correctly')
catch
    error('Unexpected Error!')
end

end
function check_bad (input, msg)
try
    hojjatazimi.report(input)
    error(msg)
catch
    disp('problme detected successfully')
end
end
