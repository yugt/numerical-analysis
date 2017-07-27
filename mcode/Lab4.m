%%%%%%% Task 1

equation = 'Dy = (y+t)/(y-t)';
initial = 'y(0) = 1';
y = dsolve(equation, initial, 't');
pretty(y)


x=[10 32 100 316 1000 3162 10000 31623 100000];

for i=1:9
    temp=euler(@butcher,0,1,1,x(i));
    disp((temp(x(i)+1,2)-sqrt(3)-1)*x(i))
end

format long

for i=1:9
    temp=heun(@butcher,0,1,1,x(i));
    disp((temp(x(i)+1,2)-sqrt(3)-1)*x(i)^3)
end

for i=1:9
    [junk, temp]=ab2(@butcher,[0 1],1,x(i));
    disp((temp(x(i)+1)-sqrt(3)-1)*x(i)^2)
end

for i=1:9
    temp=rk4(@butcher,0,1,1,x(i));
    disp((temp(x(i)+1,2)-sqrt(3)-1)*x(i)^4)
end



for i=1:9
    temp=taylor(@dbutcher,0,1,1,x(i));
    disp((temp(x(i)+1,2)-sqrt(3)-1)*x(i)^4)
end



%%%%%%%% Task2
ode23(@butcher, [0 1], 1);
[t,X]=ode45(@Phi, [0,20], [-8 8 28]');
plot(X(:,1), X(:,2))
plot(X(:,1), X(:,3))
plot(X(:,2), X(:,3))
subplot(3,1,1)
plot(t,X(:,1))
subplot(3,1,2)
plot(t,X(:,2))
subplot(3,1,3)
plot(t,X(:,3))


%%%%%%%%%% Task 3

clear all
h = 0.1; % mesh size
[x,y] = meshgrid ( 0:h:2*pi, -1:h:1 );
px = ones ( size ( x ) );
py = stiff2ode ( x, y );
quiver ( x, y, px, py )
axis tight equal
hold on
x1=(0:h:2*pi);
y1=stiff2solution(x1);
plot(x1,y1,'r')
hold off

temp=euler(@stiff2ode,0,2*pi,0,40);
plot(temp(:,1),temp(:,2))
temp=rk4(@stiff2ode,0,2*pi,0,40);
plot(temp(:,1),temp(:,2))
temp=rk4(@stiff2ode,0,2*pi,0,1000);
plot(temp(:,1),temp(:,2))


%%%%%%%%%% Task 4

ode15s(@stiff2ode,[0 2*pi], 0)
