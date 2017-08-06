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
X1=newton_Highdim( f,Jf,[10;1],1e-300,1e-300,10);
X1=newton_Highdim( f,Jf,[-10;2],1e-300,1e-300,10);


% Secant method for higher dimension
X=secant_Highdim(f,Jf,[0;0],[1;1],1e-300,1e-300,20);
X=secant_Highdim(f,Jf,[0;0],[-1;-1],1e-30,1e-30,30);
[abs(X(1,:)+sqrt((sqrt(5)-1)/2))' abs(X(2,:)-(sqrt(5)-1)/2)']

% loglog(abs(X(1,:)-sqrt((sqrt(5)-1)/2)),abs(X(2,:)-(sqrt(5)-1)/2))


%%%%%% Task 2
f=@(t) 3*sec(t)-2*cos(tan(t)/1000*(1-10*pi/3-exp(-sec(t)*tan(t)/100)))-1;
df=@(t) 3*tan(t)*sec(t)+(sec(t)*exp(-(1/100)*tan(t)*sec(t))*(3*tan(t)^3+3*tan(t)*sec(t)^2-100*sec(t)*((10*pi-3)*exp(1/100*tan(t)*sec(t))+3))*sin((tan(t)*(-exp(-(1/100)*tan(t)*sec(t))+1-(10*pi)/3))/1000))/150000;
newton(f,df,1,1e-16,1e-16,10)
% 
% 
% fplot(@(t) df(t),[-1,1])

% fplot(@(t) 3*sec(t)-2*cos(tan(t)/1000*(1-10*pi/3-exp(-sec(t)*tan(t)/100)))-1,[-1.3,1.3])
% axis([-1.3 1.3 -2 1]);


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



%%%%%% Task 3




x=50:5:125;
y=[34780 28610 23650 19630 16370 13720 11540 9744 8261 7030 6005 5147 4427 3820 3307 2872];

syms a b c;
et=a*exp(b./(x+c))'; % estimate
E=((y'-et)'*(y'-et)); % error
% E=a^2*(et'*et)-2*a*(y*et)+y*y';

double(subs(E,{a,b,c},{1.53,2390,288}))
temp=7e05;

cand=[];
for i=1.50:0.01:1.53
	for j=2350:2400
		for k=180:195
			if double(subs(E,{a,b,c},{i,j,k}))<temp
				temp=double(subs(E,{a,b,c},{i,j,k}))
				cand=[cand [i;j;k;temp]];
				double(subs(g,{a,b,c},{i,j,k}))
			end
		end
	end
end

dy=y-exp(2390.91074802608./(x+188.153946322168))*1.53306388436911;
set(gca(), 'LooseInset', get(gca(), 'TightInset'));
plot(x,(dy))
hold on
fplot(@(x) 100*(x-50)*exp(-(x-50)/16),[50,125])
hold off

legend('Residual','100*(x-50)*exp(-(x-50)/12)','Location','NorthEast')



% plot(x+5501464534.50766,2245360093.83860./log(y/8265.91321007004))
% plot(x,log(y/1.6),x,2500./(x+200))

% hold on
% for i=1:10
%     %plot(x./25,100./(log(y)+i));
%     %plot(x,exp(2000./(x+200)))
% end
% hold off





    



g=gradient(E,[a,b,c]);
H=hessian(E,[a,b,c]);


%Secant method


x0=[1.53395060236349;2390.57619051588;188.134672703047];
x1=[1.53355930237206;2390.72624233791;188.143059536112];

X=[];


s=x1-x0;
z=double(subs(g,{a,b,c},{x1(1),x1(2),x1(3)})-subs(g,{a,b,c},{x0(1),x0(2),x0(3)}));
Jf=double(subs(H,{a,b,c},{x0(1),x0(2),x0(3)}));
A=Jf+(z-Jf*s)*s'/norm(s,2)^2;
w=A\z;
X=[X x0];
x0=x1;
x1=x1-w;


for k=1:100
    if(s'*s<1e-10)||(z'*z<1e-10)
        break
    end
    s=x1-x0;
    z=double(subs(g,{a,b,c},{x1(1),x1(2),x1(3)})-subs(g,{a,b,c},{x0(1),x0(2),x0(3)}));
    Jf=double(subs(H,{a,b,c},{x0(1),x0(2),x0(3)}));
    A=Jf+(z-Jf*s)*s'/norm(s,2)^2;
    w=A\double(subs(g,{a,b,c},{x1(1),x1(2),x1(3)}));
    X=[X x0];
    x0=x1;
    x1=x1-w;
end

X=[X x1];





Newton Always Fail
p0=[1.53306388436911;2390.91074802608;188.153946322168];
for k=1:100
	X=[X p0];
	p1=p0-double(subs(H,{a,b,c},{p0(1),p0(2),p0(3)}))\double(subs(g,{a,b,c},{p0(1),p0(2),p0(3)}));
	err=(p1-p0)'*(p1-p0);
	p0=p1;
    y=double(subs(g,{a,b,c},{p0(1),p0(2),p0(3)}));
	if (err<1e-16||y'*y<1e-16)
		break
	end
end


for i=1:27
    if double(subs(E,{a,b,c},{X(1,i),X(2,i),X(3,i)}))<temp
        temp=double(subs(E,{a,b,c},{X(1,i),X(2,i),X(3,i)}))
        cand=[cand [X(1,i);X(2,i);X(3,i);temp]];
        double(subs(g,{a,b,c},{X(1,i),X(2,i),X(3,i)}))
    end
end
