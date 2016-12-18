function [new_point, optimality] = fixed_steepest_descent_iteration(symbols, init_point, obj_function, stp_size, min)
grad = transpose(gradient(obj_function, symbols));
if(min)
    gradient_factor = -1;
else
    gradient_factor = 1;
end
    new_point = init_point + gradient_factor * stp_size * subs(grad, symbols, init_point);
    if(norm(subs(grad, symbols, new_point)) < 0.0001)
        optimality = true;
    else
        optimality = false;
    end
end