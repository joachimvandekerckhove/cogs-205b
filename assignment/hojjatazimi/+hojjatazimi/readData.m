function content = readData(file_name)
%readData loads a local file in to memory as a Matlab variable
%   input: path to the local file; output: contents of the file as a Matlab
%   function.
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