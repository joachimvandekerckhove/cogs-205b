function file_name = getData(URL)
%getData This Functions gets an input URL and downloads the linked file in
%to local storage. 
%   input: URL; output: path to the downloaded file; the function runs
%   sanity test to check if the URL is valid then tries to download it
%   using websave method.
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