function test_getData
%TEST_GETDATA checks getData
good_url = 'http://cidlab.com/files/cogs205b.csv';
try
    file = hojjatazimi.getData(good_url);
    if isfile(file)
        disp('test successful')
    else
        error('file not found!')
    end
catch
    error(['unexpected error for input: ' good_url])
end
bad_url(5, 'non-string not detected')
bad_url('abcd', 'no http not detected')
bad_url('http', 'no / not detected')
bad_url('http/', 'no : not detected')
end

function bad_url(url, er)
try
    hojjatazimi.getData(url)
    error(er)
catch
    disp(["error detected succesfully for " string(url)])
end
end
