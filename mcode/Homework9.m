%%%%%% Exercise 1
% dy=@(t,y) 1+y^2;
% 
format long
% for i=1:9
%     temp=euler(dy,0,3,0,i);
%     disp((temp(i+1,2)))
% end

%%%%%% Exercise 3
dy=@(t,y) (2+0.01*t^2)*y;
temp=euler(dy,0,15,4,15);

Euler=temp(:,2);


temp=backwardeuler(0,15,4,15);
BEuler=temp(:,2);



temp=taylor2nd(dy,@(t,y)0.02*t*y,@(t,y)2+0.01*t^2,0,15,4,15);
Taylor2nd=temp(:,2);


temp=heun(dy,0,15,4,15);
Heun=temp(:,2);


[x,AB2]=ab2 ( dy, [0, 15], 4, 15 );


temp=rk2(dy,0,15,4,15);
RK2=temp(:,2);


temp=rk4(dy,0,15,4,15);
RK4=temp(:,2);


Exact=4*exp(x.^3/300+2*x);

% set(gca(), 'LooseInset', get(gca(), 'TightInset'));

semilogy(x,Exact,x,Euler,x,BEuler,x,Taylor2nd,x,Heun,x,AB2,x,RK2,x,RK4)
legend('Exact','Euler','Backward Euler','Taylor 2nd order','Heun','Adams-Bashforth','Runge-Kutta 2nd order','Runge-Kutta 4th order','Location','NorthWest')
axis([0 15 1 1e20]);