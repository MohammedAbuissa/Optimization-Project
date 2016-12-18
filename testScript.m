n = [100,10];
o = 0;
syms x
syms y
de_jong_2d = x.^2 + y.^2;
rosenbrock_valley = 100 * (y-x.^2)^2 + (1-x).^2;
rastigin = 10 *2 + (x.^2-10*cos(2*pi*x)) + (y.^2 - 10 * cos(2*pi*y));
easom = -cos(x) * cos(y) * exp(-(x-pi).^2 - (y-pi).^2);

iterations_count = 0;

while(o == false)
[n, o] = optimum_steepest_descent_iteration([x y], n, rosenbrock_valley, true);
iterations_count = iterations_count +1;
end

disp(n);
disp(iterations_count);