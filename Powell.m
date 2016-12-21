function [ new_point, optimality ] = Powell(symbols, init_point, obj_function, reg)
%POWELL Summary of this function goes here
%   Detailed explanation goes here
syms f1
syms f2
syms f3
syms f4
syms x1
syms x2
syms x3
syms x4

x1 = init_point(1);
x2 = init_point(2);
x3 = init_point(3);

f1= subs(obj_function, symbols, x1);
f2= subs(obj_function, symbols, x2);
f3= subs(obj_function, symbols, x3);

x4= eval(0.5*(((x2*x2-x3*x3)*f1+(x3*x3-x1*x1)*f2+(x1*x1-x2*x2)*f3)/((x2-x3)*f1+(x3-x1)*f2+(x1-x2)*f3)));

f4 = subs(obj_function, symbols, x4);

if(x4>x2)
    if(f4<f2)
        x1=x2;
        x2=x4;
    else
        x3=x4;
    end
else
    if(f4<f2)
        x3=x2;
        x2=x4;
    else
        x1=x4;
    end
end

new_point=[x1,x2,x3];

if(x3-x1>reg)
    optimality = false;
else
    optimality = true;
end
end

