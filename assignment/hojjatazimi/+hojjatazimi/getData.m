function file_name = getData(URL)
check_url(URL)
name = url2name(URL);

file_name = websave(name, URL);
end

function name = url2name(url)
matches = strfind(url, '/');
url_length = length (url);
matches_length = length(matches);
final_match = matches(matches_length);

name = url(final_match + 1 :url_length);
end

function check_url(url)
if ~(isstring(url) || ischar(url))
    error('input is not String')
end
if ~contains(url, 'http')
    error('invalid url (needs http)')
end
if ~contains(url, '/')
    error('invalid url (needs /)')
end
if ~contains(url, ':')
    error('invalid url (needs :)')
end
end