function [new_point, optimality] = optimum_steepest_descent_iteration(symbols, init_point, obj_function, min)
grad = transpose(gradient(obj_function, symbols));
if(min)
    gradient_factor = -1;
else
    gradient_factor = 1;
end
syms lambda
lambda_point(lambda) = init_point + gradient_factor * lambda * subs(grad, symbols, init_point);
lambda_value = transpose(solve(subs(obj_function, symbols, lambda_point), lambda));
new_point = lambda_point(lambda_value(1));
if(norm(subs(grad, symbols, new_point)) < 0.0001)
    optimality = true;
else
    optimality = false;
end
end