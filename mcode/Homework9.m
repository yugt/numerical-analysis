%%%%%% Exercise 1
% dy=@(t,y) 1+y^2;
% 
format long
% for i=1:9
%     temp=euler(dy,0,3,0,i);
%     disp((temp(i+1,2)))
% end

%%%%%% Exercise 3
% dy=@(t,y) (2+0.01*t^2)*y;
% temp=euler(dy,0,15,4,15);
% 
% Euler=temp(:,2);
% 
% 
% temp=backwardeuler(0,15,4,15);
% BEuler=temp(:,2);
% 
% 
% 
% temp=taylor2nd(dy,@(t,y)0.02*t*y,@(t,y)2+0.01*t^2,0,15,4,15);
% Taylor2nd=temp(:,2);
% 
% 
% temp=heun(dy,0,15,4,15);
% Heun=temp(:,2);
% 
% 
% [x,AB2]=ab2 ( dy, [0, 15], 4, 15 );
% 
% 
% temp=rk2(dy,0,15,4,15);
% RK2=temp(:,2);
% 
% 
% temp=rk4(dy,0,15,4,15);
% RK4=temp(:,2);
% 
% 
% Exact=4*exp(x.^3/300+2*x);
% 
% set(gca(), 'LooseInset', get(gca(), 'TightInset'));
% 
% semilogy(x,Exact,x,Euler,x,BEuler,x,Taylor2nd,x,Heun,x,AB2,x,RK2,x,RK4)
% legend('Exact','Euler','Backward Euler','Taylor 2nd order','Heun','Adams-Bashforth','Runge-Kutta 2nd order','Runge-Kutta 4th order','Location','NorthWest')
% axis([0 15 1 1e20]);

%%%%%% Exercise 3
% f=@(t,y) [y(2); y(3); -y(3)/t+2*y(2)/t^2-2*y(1)/t^3+8-2/t^3  ];
% M=10;
% h=1/M;
% T=zeros(1,M+1);
% Y=zeros(3,M+1);
% T=1:h:2;
% Y(:,1)=[2;8;6];
% for j=1:M
%    k1=h*f(T(j),Y(:,j));
%    k2=h*f(T(j)+h/2,Y(:,j)+k1/2);
%    k3=h*f(T(j)+h/2,Y(:,j)+k2/2);
%    k4=h*f(T(j)+h,Y(:,j)+k3);
%    Y(:,j+1)=Y(:,j)+(k1+2*k2+2*k3+k4)/6;
% end
% set(gca(), 'LooseInset', get(gca(), 'TightInset'));
% Exact=-1./T+2*T+T.^2+T.^3-1;
% plot(T,Exact-Y(1,:))

% legend('Exact','Runge-Kutta 4th order','Location','NorthWest')

f=@(t,y) 1/((t-0.3)^2+0.01)+1/((t-0.9)^2+0.04)-6;
temp=rk4(f,0,1,0,100);



