% Using a hill-climbing optimization algorithm, 
% find the maximum of f(x,y) = e^{-x^2-y^2}

objective = @(x,y) exp(-x.^2-y.^2);
current_x = -0.5;
current_y = 0.5;
current_z = objective(current_x, current_y);

step_x    = 0.005;
step_y    = 0.005;
n_iter = 100000;
flag = 0;

for i = 1:n_iter
    new_x = current_x + step_x;
    new_z = objective(new_x, current_y);
    if new_z >= current_z
        current_x = new_x;
        current_z = new_z;
    else
        step_x = -step_x * 2/3;
    end
    
    % The candidate
    new_y = current_y + step_y;
    % The evaluation
    new_z = objective(current_x, new_y);
    % The accept/reject
    if new_z >= current_z
        current_y = new_y;
        current_z = new_z;
    else
        step_y = -step_y * 2/3;
    end
    
    % The stopping rule
    if current_z > .9999
        flag = 1;
        break
    end

    if flag == 1
        break;
    end
end

disp([current_x current_y])

