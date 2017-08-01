function [ R ] = rk2(f,a,b,ya,M)

h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
   Y(j+1)=Y(j)+h*f(T(j)+h/2,Y(j)+h/2*f(T(j),Y(j)));
end

R=[T' Y'];

end

