function content = readData(file_name)
%readData loads a local file in to memory as a Matlab variable
%   input: path to the local file; output: contents of the file as a Matlab
%   function.
    fid = fopen(file_name);
    fseek(fid, 0, 'eof');
    size = ftell(fid);
    fclose(fid);
    fid = fopen(file_name);
    content = char(zeros(1, size));
    cntr = 1;
    while ~feof(fid)
        buffer = fgetl(fid);
        buffer_length = length(buffer);
        content(cntr:cntr+buffer_length) = [buffer newline];
        cntr = cntr + buffer_length + 1;
    end
    fclose(fid);

    content_length = length(content);
    content = content(1 : content_length - 1);
end