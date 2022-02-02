function content = readData(file_name)
    fid = fopen(file_name);
    content = '';
    while ~feof(fid)
        buffer = fgetl(fid);
        content = [content buffer newline];
    end
    fclose(fid);

    content_length = length(content);
    content = content(1 : content_length - 1);
end