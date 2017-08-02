%%%%%% Task 1

% Fixed-point iteration
g=@(x)[x(1)^2+x(1)-x(2);x(1)^2+x(2)^2+x(2)-1];
P=fixedpoint(g,[0.786;0.618],1e-6,100);





% Why fixed-point fail
Jg=[sqrt(2*(sqrt(5)-1))+1, -1; sqrt(2*(sqrt(5)-1)), sqrt(5)];
norm(Jg,2)

% Newton's method for higher dimension
f=@(x) [x(1)^2-x(2);x(1)^2+x(2)^2-1];
Jf=@(x) [ 2*x(1), -1; 2*x(1), 2*x(2)];
% X1=newton_Highdim( f,Jf,[10;1],1e-300,1e-300,10);

% X1=newton_Highdim( f,Jf,[-10;2],1e-300,1e-300,10);


% Secant method for higher dimension
% X=secant_Highdim(f,Jf,[0;0],[1;1],1e-300,1e-300,20);

X=secant_Highdim(f,Jf,[0;0],[-1;-1],1e-30,1e-30,30);
[abs(X(1,:)+sqrt((sqrt(5)-1)/2))' abs(X(2,:)-(sqrt(5)-1)/2)']

% loglog(abs(X(1,:)-sqrt((sqrt(5)-1)/2)),abs(X(2,:)-(sqrt(5)-1)/2))