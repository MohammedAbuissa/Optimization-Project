n = [0,0];
o = 0;
syms x y
syms erorr
func = 6*x.^2 - 6*x*y + 2*y.^2 - x-2*y;
erorr = 0.01;

iterations_count = 0;

while(o == false)
[n, o] = Univariate([x y], n, func, erorr , iterations_count);
iterations_count = iterations_count +1;
end

disp(n);
disp(iterations_count);