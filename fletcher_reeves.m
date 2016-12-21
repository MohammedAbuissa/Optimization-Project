function [location, optima, time, iterations_count] = fletcher_reeves (obj_function, symbols, solution, initial_point, number_of_iterations)
    iterations_count = 0;
    pre_location = initial_point;
    
    tic;
    [location, optima] = optimum_steepest_descent_iteration(symbols, pre_location, obj_function, false,0.001);
    o = 0;
    grad = transpose(gradient(obj_function, symbols));
    direction = -1 * subs(grad, symbols, pre_location);
    
    while(o == false && iterations_count ~= number_of_iterations)
        [l, direction ,optima ,o] = fletcher_reeves_iteration(symbols, pre_location ,direction ,location, obj_function,0.001);
        pre_location = location;
        location = l;
        iterations_count = iterations_count +1;
    end
    time = toc;
    plot_benchmark_result(obj_function, symbols,solution, location, optima);
end