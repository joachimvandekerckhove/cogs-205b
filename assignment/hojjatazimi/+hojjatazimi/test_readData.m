function  test_readData()
%TEST_READDATA checks readData
bad_file = "sdfsdfsdfsgfndkfgnerltberwhtbmfgb";
try
    hojjatazimi.readData(bad_file)
    error('no error for bad file')
catch
    disp('file not found successful')
end
end

