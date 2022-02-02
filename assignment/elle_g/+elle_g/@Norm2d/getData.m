%download data from url into a table
function out = getData(url)
    options=weboptions("ContentType", "table");
    out=webread(url, options);
end

