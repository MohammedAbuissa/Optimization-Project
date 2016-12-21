n = [3.2,3.3];
o = 0;
syms x
syms y
de_jong_2d = x.^2 + y.^2;
rosenbrock_valley = 100 * (y-x.^2)^2 + (1-x).^2;
rastigin = 10 *2 + (x.^2-10*cos(2*pi*x)) + (y.^2 - 10 * cos(2*pi*y));
easom = -cos(x) * cos(y) * exp(-(x-pi).^2 - (y-pi).^2);
branin = (y-(5.1/(4*pi^2))*x^.2+(5/pi)*x-6).^2 + 10*(1- (1/(8*pi)))*cos(x)+10;
iterations_count = 0;

while(o == false)
[n, min ,o] = optimum_steepest_descent_iteration([x y], n, easom, true,0.001);
iterations_count = iterations_count +1;
end

disp(n);
disp(iterations_count);
disp(min);
