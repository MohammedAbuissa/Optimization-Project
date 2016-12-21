function [location, optima, time, iterations_count] = steepest_descent (obj_function, symbols, solution, min, initial_point, number_of_iterations, optimum, fixed_step, tolerance)
    iterations_count = 0;
    o = 0;
    location = initial_point;
    tic;
    if(optimum)
        while(o == false && iterations_count ~= number_of_iterations)
            [location, optima ,o] = optimum_steepest_descent_iteration(symbols, location, obj_function, min,tolerance);
            iterations_count = iterations_count +1;
        end
    else
        while(o == false && iterations_count ~= number_of_iterations)
            [location, optima ,o] = fixed_steepest_descent_iteration(symbols, location, obj_function, fixed_step,min,tolerance);
            iterations_count = iterations_count +1;
        end
    end
    time = toc;
    plot_benchmark_result(obj_function, symbols,solution, location, optima);
end