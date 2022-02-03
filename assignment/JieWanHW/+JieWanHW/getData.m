% Input a URL and it will download the data file to the local folder.

function name = getData(url)
	level = wildcardPattern + "/";
	pat = asManyOfPattern(level);
	name = extractAfter(url,pat);
	websave(name,url);
end