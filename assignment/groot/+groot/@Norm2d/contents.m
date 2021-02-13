function contents(obj)
%CONTENTS Prints help text for all functions 
    
    % Get all methods related to class 
    methods_list = methods(obj);
    
    % Disp all help functions
    for i = 1:length(methods_list)
        help (strcat('groot.Norm2d.', methods_list{i}));
    end
end

