%benchmark functions
syms x
syms y
de_jong_2d = x.^2 + y.^2; % 0 @ 0,0 
rosenbrock_valley = 100 * (y-x.^2)^2 + (1-x).^2; %  0@ 1,1
rastigin = 10 *2 + (x.^2-10*cos(2*pi*x)) + (y.^2 - 10 * cos(2*pi*y)); % 0 @ 0,0
easom = -cos(x) * cos(y) * exp(-(x-pi).^2 - (y-pi).^2); % -1 @ pi, pi
branin = (y-(5.1/(4*pi^2))*x^.2+(5/pi)*x-6).^2 + 10*(1- (1/(8*pi)))*cos(x)+10; % 0.398 @ (-pi, 12.275); (pi, 2.275); (9.42478, 2.475)

%steepest descent
n = [10,3.23];
%(obj_function, symbols, solution, min, initial_point, number_of_iterations, optimum, fixed_step, tolerance)
[location, optima, time, count] = steepest_descent(easom, [x y], [pi, pi], true, n, 10, true, 0.01, 0.001);

disp('steepest descent');
fprintf('time: %d\n',time);
fprintf('count: %d\n', count);
fprintf('optima: %d\n', optima);
fprintf('location: %d, %d\n', location(1), location(2));

%fletcher reeves
n = [0.01,0.01];
%(obj_function, symbols, solution, initial_point, number_of_iterations, tolerance)
[location, optima, time, count] = fletcher_reeves(rastigin, [x y], [0,0], n, 10, 0.001);

disp('fletcher reeves');
fprintf('time: %d\n',time);
fprintf('count: %d\n', count);
fprintf('optima: %d\n', optima);
fprintf('location: %d, %d\n', location(1), location(2));