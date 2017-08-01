function [ BE ] = backwardeuler( a,b,ya,M )

h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;

for j=1:M
   %Y(j+1)=Y(j)+h*f(T(j),Y(j));
   %Y(j+1)=solve('Y(j)-x+h*f(T(j+1),x)==0','Real','x');
   Y(j+1)=Y(j)/(1-h*(2+0.01*T(j+1)^2));
end

BE=[T' Y'];

end

