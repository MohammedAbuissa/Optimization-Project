n = [-0.5,0,0.5];
o = 0;
syms x
syms reg
func = 17*x.^4 - 38*x.^3 + 27*x.^2 - 6*x;
reg = 0.165;

iterations_count = 0;

while(o == false)
[n, o] = Powell(x, n, func, reg);
iterations_count = iterations_count +1;
end

disp(n);
disp(iterations_count);