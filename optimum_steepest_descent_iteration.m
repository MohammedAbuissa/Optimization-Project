function [new_point, function_value, optimality] = optimum_steepest_descent_iteration(symbols, init_point, obj_function, min, tolerance)
    grad = transpose(gradient(obj_function, symbols));
    if(min)
        gradient_factor = -1;
    else
        gradient_factor = 1;
    end
    
    syms lambda
    
    lambda_point(lambda) = init_point + gradient_factor * lambda * subs(grad, symbols, init_point);
    lambda_value = transpose(vpasolve(gradient(subs(obj_function, symbols, lambda_point), lambda), lambda));
    
    %invalid lambda values
    if(isempty(lambda_value))
        error('cant find optimal step size');
    elseif (isa(lambda_value, 'sym'))
        lambda_value = eval(lambda_value);
        if(isnan(lambda_value))
            error('step size is not defined');
        end
    end
            
    new_point = eval(lambda_point(real(lambda_value(1))));
    
    function_value = real(eval(subs(obj_function, symbols, new_point)));
    
    if(norm(subs(grad, symbols, new_point)) < tolerance)
        optimality = true;   
    else
        optimality = false;
    end
end