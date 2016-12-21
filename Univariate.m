function [ new_point, optimality ] = Univariate ( symbols, init_point, obj_function, erorr , iterations_count )
%UNIVARIATE  Summary of this function goes here
%   Detailed explanation goes here

syms Xnew
syms Xpluse
syms Xminus
syms Xold
syms Snew
syms Fpluse
syms Fminus
syms F
syms Fnew
syms lambda
syms direction
syms Lambdaa

Xold = init_point;
Snew = [ mod(iterations_count,2) , mod(iterations_count+1,2)];

Xpluse = Xold + erorr * Snew;
Xminus = Xold - erorr * Snew;

F = subs(obj_function, symbols, Xold);
Fpluse = subs(obj_function, symbols, Xpluse);
Fminus = subs(obj_function, symbols, Xminus);

if(Fpluse<F)
    if(Fminus>F)
        direction = true;
    else
        optimality=true; 
    end
else
    if(Fminus<F)
        direction = false;
    end
end

if(direction)
    Xnew= Xold + lambda * Snew;
else
    Xnew= Xold - lambda * Snew;
end

Fnew = subs(obj_function, symbols, Xnew);

Lambdaa=solve(Fnew);

if(direction)
    new_point= Xold + Lambdaa * Snew;
else
    new_point= Xold - Lambdaa * Snew;
end
end


