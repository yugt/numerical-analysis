function [ X ] = secant_Highdim(f,Jf,x0,x1,delta,epsilon,max1)

X=[];


s=x1-x0;
y=f(x1)-f(x0);
A=Jf(x0)+(y-Jf(x0)*s)*s'/norm(s,2)^2;
Ainv=inv(A);
w=A\y;
X=[X x0];
x0=x1;
x1=x1-w;


for k=2:max1
    if(s'*s<delta)||(y'*y<epsilon)
        break
    end
    s=x1-x0;
    y=f(x1)-f(x0);
    A=A-(y-A*s)*s'/norm(s,2)^2;
    Ainv=Ainv+(s-Ainv*y)*s'*Ainv/(s'*Ainv*y);
    w=Ainv*f(x1);
    X=[X x0];
    x0=x1;
    x1=x1-w;
end

X=[X x1];


% X=[];
% A=Jf(x0)+(f(x1)-f(x0)-Jf(x0)*(x1-x0))*(x1-x0)'/norm(x1-x0,2)^2;
% 
% for k=1:max1
% 	s=x1-x0;
% 	y=f(x1)-f(x0);
% 	A=A-(y-A*s)*s'/norm(s,2)^2;
% 	w=A\f(x1);
%     x2=x1-w;
% 	X=[X x0];
% 	x0=x1;
% 	x1=x2;
%     if(s'*s<delta)||(f(x1)'*f(x1)<epsilon)
%         break
%     end
% end
% 
% X=[X x1];



end