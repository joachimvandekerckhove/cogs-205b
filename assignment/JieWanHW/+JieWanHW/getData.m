% Input a URL and it will download the data file to the local folder.

function name = getData(url)
    %[~, b]=webread(url); urlread()
%     dat=webread(url);
%     if isempty(dat)
%         error('getData:urlNotValid','Valid url needed.') 
%     end 

	level = wildcardPattern + "/";
	pat = asManyOfPattern(level);
	name = extractAfter(url,pat);
%     try
%         websave(name,url);
%     catch
%         error('getData:urlNotValid','Valid url needed.') 
%     end
	websave(name,url);
end