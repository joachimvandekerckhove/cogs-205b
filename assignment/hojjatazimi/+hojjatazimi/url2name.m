function name = url2name(url)
    matches = strfind(url, '/');
    url_length = length (url);
    matches_length = length(matches);
    final_match = matches(matches_length);

name = url(final_match + 1 :url_length);
end