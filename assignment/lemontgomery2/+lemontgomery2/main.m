function output = main()

    % MAIN    Entry point function, has settings, calls required functions

    % set url by getting user input
    if ~nargin
        url = input('Enter the url here: ', 's');
    end
    
    % data getting and reading
    file = lemontgomery2.getData(url);
    data = lemontgomery2.readData(file);
    output = lemontgomery2.report(data);
    
end