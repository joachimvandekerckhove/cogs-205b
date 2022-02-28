function main()

    % MAIN    Entry point function, has settings, calls required functions
    
    % set url by getting user input
    url = input('Enter the url here: ', 's');
    
    % data getting and reading
    file = lemontgomery2.getData(url);
    data = lemontgomery2.readData(file);
    lemontgomery2.report(data);
    
end