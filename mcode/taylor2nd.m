function [ T2 ] = taylor2nd( f,fdt,fdy,a,b,ya,M )

h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;

for i=1:M
   p=f(T(i),Y(i));
   pt=fdt(T(i),Y(i));
   py=fdy(T(i),Y(i));
   Y(i+1)=Y(i)+h*p+h*h*(pt+py*p)/2;
end

T2=[T' Y'];

end

