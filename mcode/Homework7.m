%%%%	Exercie 7.3
% format long
% f = @(x) tan(x)-4*x;
% df = @(x) sec(x)^2-4;
% newton(f,df,1.57,1e-4,1e-3,100)
% newton(f,df,4.7,1e-4,1e-3,100)


%%%%	Exercise 7.5
% f = @(x) sin(x^3);
% df = @(x) 3*x^2*cos(x^3);
% newton_Modified(f,df,1,1,1e-10,1e-10,100)
% newton_Modified(f,df,1,3,1e-10,1e-10,100)
% 
% u = @(x) tan(x^3)/(3*x^2);
% du = @(x) sec(x^3)^2 - (2*tan(x^3))/(3*x^3);
% newton_Improved(f,u,du,1,1e-20,1e-20,6)



%%%%	Exercise 7.5
f = @(x) x^5-11*x^4+46*x^3-90*x^2+81*x-27;
df = @(x) 5*x^4-44*x^3+138*x^2-180*x+81;
u = @(x) f(x)/df(x);
du = @(x) (5*x^2-18*x+21)/(5*x-9)^2;
% newton_Modified(f,df,1.2,1,1e-11,1e-11,100)
% newton_Improved(f,u,du,1.2,1e-20,1e-20,6)
% newton_Modified(f,df,3.01,1,1e-20,1e-80,100)
% newton_Improved(f,u,du,3.02,1e-80,1e-40,40)

