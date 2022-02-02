function file_name = getData(URL)
    name = hojjatazimi.url2name(URL);

file_name = websave(name, URL);
end