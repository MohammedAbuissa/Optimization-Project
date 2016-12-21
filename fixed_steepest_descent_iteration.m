function [new_point, function_value, optimality] = fixed_steepest_descent_iteration(symbols, init_point, obj_function, stp_size, min, tolerance)
    grad = transpose(gradient(obj_function, symbols));
    if(min)
        gradient_factor = -1;
    else
        gradient_factor = 1;
    end
    new_point = init_point + gradient_factor * stp_size * subs(grad, symbols, init_point);
    function_value = eval(subs(obj_function, symbols, new_point));
    if(norm(subs(grad, symbols, new_point)) < tolerance)
        optimality = true;
    else
        optimality = false;
    end
end