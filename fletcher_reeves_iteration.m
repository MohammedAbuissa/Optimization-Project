function [new_point, direction, function_value, optimality] = fletcher_reeves_iteration(symbols, pre_point, pre_direction,init_point, obj_function, tolerance)
    grad = transpose(gradient(obj_function, symbols));
    
    init_grad = subs(grad, symbols, init_point);
    pre_grad = subs(grad, symbols, pre_point);
    direction = -1* init_grad + (norm(init_grad).^2/norm(pre_grad).^2) * pre_direction;
    
    syms lambda
    lambda_point(lambda) = init_point + lambda * direction;
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
            
    new_point = real(eval(lambda_point(real(lambda_value(1)))));
    
    function_value = real(eval(subs(obj_function, symbols, new_point)));
    
    if(norm(subs(grad, symbols, new_point)) < tolerance)
        optimality = true;   
    else
        optimality = false;
    end
end