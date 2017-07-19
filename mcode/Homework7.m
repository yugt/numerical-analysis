%%%%	Exercie 7.3
% format long
% f = @(x) tan(x)-4*x;
% df = @(x) 1/(cos(x)^2)-4;
% newton(f,df,1.57,1e-4,1e-3,100)
% newton(f,df,4.7,1e-4,1e-3,100)


%%%%	Exercise 7.5
f = @(x) sin(x^3);
df = @(x) 3*x^2*cos(x^3);
newton_Modified(f,df,1,3,1e-10,1e-10,100)