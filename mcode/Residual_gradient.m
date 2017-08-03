function [ gradient ] = Residual_gradient( position )

[a;b;c]=position;
x=50:5:125;
y=[34780 28610 23650 19630 16370 13720 11540 9744 8261 7030 6005 5147 4427 3820 3307 2872];
gradient=zeros(3,1);
et=zeros(16,1);

for i=1:16
	et(i)=exp(b/(x(i)+c))
end

gradient=
[
(2*a*et'*et)-2*(y'*et);
(2*a^2)*(1./(x+c))*et.^2;

]

end