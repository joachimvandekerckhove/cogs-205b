function [outputArg1,outputArg2] = test_readData(inputArg1,inputArg2)
%TEST_READDATA Summary of this function goes here
%   Detailed explanation goes here
bad_file = "sdfsdfsdfsgfndkfgnerltberwhtbmfgb"
try
    hojjatazimi.readData(bad_file)
    error('no error for bad file')
catch
    disp('file not found successful')
end
end

