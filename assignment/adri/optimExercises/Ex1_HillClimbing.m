% Using a hill-climbing optimization algorithm, find the maximum of 
% log(f(x)) where f(x) = e^{-x^2}.  Compare to the maximum of f(x).

objective      = @(x) exp(-x.^2);   
support = [linspace(1,50,20)];


step_size      = 0.05;
current_x  = 1;
current_y = objective(current_x);
% Climb that hill!
n_steps = 200;
    for i = 1:n_steps
        new_x  = current_x + step_size;
        new_y = objective(new_x);    
        if new_y >= current_y
            current_x = new_x;
            current_y = new_y;
        else
            step_size = -step_size * 2/3;
        end
    end
disp(current_x)


