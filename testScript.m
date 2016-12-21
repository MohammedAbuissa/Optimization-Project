n = [2,1.1];
o = 0;
syms x
syms y
de_jong_2d = x.^2 + y.^2;
rosenbrock_valley = 100 * (y-x.^2)^2 + (1-x).^2;
rastigin = 10 *2 + (x.^2-10*cos(2*pi*x)) + (y.^2 - 10 * cos(2*pi*y));
easom = -cos(x) * cos(y) * exp(-(x-pi).^2 - (y-pi).^2);
branin = (y-(5.1/(4*pi^2))*x^.2+(5/pi)*x-6).^2 + 10*(1- (1/(8*pi)))*cos(x)+10;
iterations_count = 0;

[location, optima, time, count] = steepest_descent(rosenbrock_valley, [x y], [1 1], true, n, 10, true, 0.01);
fprintf('time: %d\n',time);
fprintf('count: %d\n', count);
fprintf('optima: %d\n', optima);
fprintf('location: %d, %d\n', location(1), location(2));
