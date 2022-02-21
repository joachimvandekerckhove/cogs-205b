% Using some of the functions |surf|, |mesh|, |contour|, and |plot3|, graph
% the so-called six-hump camelback function $C$: $C(x,y) = (4 - 2.1 x^2 +
% \frac{1}{3}x^4) x^2 + x y + 4 (y^2-1) y^2$.  Then use simulated
% annealing to find its global minimum. 

objective = @(x,y) (4 - 2.1*x.^2 + x.^4/3).*x.^2 + x.*y + 4*(-1 + y.^2).*y.^2;

%Some values to plot
X = linspace(-2, 2, 101);
Y = linspace(-2, 2, 101);
[xplane, yplane] = meshgrid(X,Y);
zvalue = objective(xplane, yplane);
%Plotting functions
s = surf(xplane,yplane,zvalue);
m = mesh(xplane,yplane,zvalue);
h = contour(xplane, yplane, zvalue);
p = plot3(xplane, yplane, zvalue);

T = .1;          %Criterion
counter = 0;     %Contador
current_x = 4 * rand - 2;
current_y = 2 * rand - 1;
current_z = objective(current_x, current_y);

while T > .001
    new_x = min(max(current_x + randn*T*10,-2),2);
    new_y = min(max(current_y + randn*T*10,-1),1);
    new_z = objective(new_x, new_y);

    if new_z <= current_z || rand < exp(-(new_z-current_z)/T)
        current_x = new_x;
        current_y = new_y;
        current_z = new_z;
    end
    
    counter = counter + 1;
    if counter > 500
        counter = 0;
        T = T * .025;  % Cool down faster!
    end
        
    if current_z < -2 || T < .001
        break
    end    
end

disp([current_x current_y current_z])