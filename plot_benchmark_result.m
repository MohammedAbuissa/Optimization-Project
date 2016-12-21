function plot_benchmark_result(obj_function, symbols ,solution, location, optima)
    figure;
    fsurf(obj_function);
    hold on;
    plot3(location(1), location(2), optima, 'ro');
    hold on;
    plot3(solution(1), solution(2), subs(obj_function, symbols, solution), '+');
    hold off;
end