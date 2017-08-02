%%%%%% Task 1

% Fixed-point iteration
% g=@(x)[x(1)^2+x(1)-x(2);x(1)^2+x(2)^2+x(2)-1];
% P=fixedpoint(g,[0.786;0.618],1e-6,100);


% Why fixed-point fail
% Jg=[sqrt(2*(sqrt(5)-1))+1, -1; sqrt(2*(sqrt(5)-1)), sqrt(5)];
% norm(Jg,2)

% Newton's method for higher dimension
% f=@(x) [x(1)^2-x(2);x(1)^2+x(2)^2-1];
% Jf=@(x) [ 2*x(1), -1; 2*x(1), 2*x(2)];
% X1=newton_Highdim( f,Jf,[10;1],1e-300,1e-300,10);

% X1=newton_Highdim( f,Jf,[-10;2],1e-300,1e-300,10);


% Secant method for higher dimension
% X=secant_Highdim(f,Jf,[0;0],[1;1],1e-300,1e-300,20);
% X=secant_Highdim(f,Jf,[0;0],[-1;-1],1e-30,1e-30,30);
% [abs(X(1,:)+sqrt((sqrt(5)-1)/2))' abs(X(2,:)-(sqrt(5)-1)/2)']

% loglog(abs(X(1,:)-sqrt((sqrt(5)-1)/2)),abs(X(2,:)-(sqrt(5)-1)/2))


%%%%%% Task 2
f=@(t) 3*sec(t)-2*cos(tan(t)/1000*(1-10*pi/3-exp(-sec(t)*tan(t)/100)))-1;
df=@(t) tan(t)*sec(t)+(sec(t)*exp(-(1/100)*tan(t)*sec(t))*(3*tan(t)^3+3*tan(t)*sec(t)^2-100*sec(t)*((10*pi-3)*exp(1/100*tan(t)*sec(t))+3))*sin((tan(t)*(-exp(-(1/100)*tan(t)*sec(t))+1-(10*pi)/3))/1000))/150000;
newton(f,df,1.23,1e-16,1e-16,10)



fplot(@(t) 3*sec(t)-2*cos(tan(t)/1000*(1-10*pi/3-exp(-sec(t)*tan(t)/100)))-1,[-1.3,1.3])
axis([-1.3 1.3 -2 1]);


% syms t
% g=sec(t)-2*cos(tan(t)/1000*(1-10*pi/3-exp(-sec(t)*tan(t)/100)));
% dg=@(t) sin(t)/cos(t)^2 + 2*sin((tan(t)*(exp(-tan(t)/(100*cos(t))) ...
%     + 5332248173269055/562949953421312))/1000)*(((exp(-tan(t)/(100*cos(t))) ...
%     + 5332248173269055/562949953421312)*(tan(t)^2 + 1))/1000 -...
%     (exp(-tan(t)/(100*cos(t)))*tan(t)*((tan(t)^2 + 1)/(100*cos(t)) +...
%     (sin(t)*tan(t))/(100*cos(t)^2)))/1000);





% fplot(@(t) sin(t)/cos(t)^2 + 2*sin((tan(t)*(exp(-tan(t)/(100*cos(t))) ...
%     + 5332248173269055/562949953421312))/1000)*(((exp(-tan(t)/(100*cos(t))) ...
%     + 5332248173269055/562949953421312)*(tan(t)^2 + 1))/1000 -...
%     (exp(-tan(t)/(100*cos(t)))*tan(t)*((tan(t)^2 + 1)/(100*cos(t)) +...
%     (sin(t)*tan(t))/(100*cos(t)^2)))/1000),[-1.3,1.3])
% axis([-1.3 1.3 -2 1]);
% hold on
% fplot(@(t)  tan(t)*sec(t)+(sec(t)*exp(-(1/100)*tan(t)*sec(t))*(3*tan(t)^3+3*tan(t)*sec(t)^2-100*sec(t)*((10*pi-3)*exp(1/100*tan(t)*sec(t))+3))*sin((tan(t)*(-exp(-(1/100)*tan(t)*sec(t))+1-(10*pi)/3))/1000))/150000,[-1.3,1.3])
% hold off