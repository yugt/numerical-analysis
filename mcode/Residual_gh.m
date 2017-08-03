function [ gradient,hessian ] = Residual_gh( position )

a=position(1);
b=position(2);
c=position(3);
x=50:5:125;
y=[34780 28610 23650 19630 16370 13720 11540 9744 8261 7030 6005 5147 4427 3820 3307 2872];

et=exp(b./(x+c))';

aa=(2*a*(et'*et))-2*(y*et);
bb=(2*a^2)*((x+c).^(-1))*(et.^2)-(2*a)*(y.*(x+c).^(-1))*et;
cc=(2*a*b)*(y.*(x+c).^(-2))*et-(2*a^2*b)*((x+c).^(-2))*(et.^2);

gradient=[aa;bb;cc];

aa=2*(et'*et);
ab=4*a*((x+c).^(-1))*(et.^2)-2*(y.*(x+c).^(-1))*et;
ac=2*b*(y.*(x+c).^(-2))*et-4*a*b*((x+c).^(-2))*(et.^2);
bb=4*a^2*((x+c).^(-2))*(et.^2)-2*a*(y.*(x+c).^(-2))*et;
bc=2*a*(y.*(x+c).^(-2))*et+2*a*b*(y.*(x+c).^(-3))*et-2*a^2*((x+c).^(-2))*(et.^2)-4*a^2*b*((x+c).^(-3))*(et.^2);
cc=4*a^2*b^2*((x+c).^(-4))*(et.^2)+4*a^2*b*((x+c).^(-3))*(et.^2)-2*a*b^2*(y.*(x+c).^(-4))*et-4*a*b*(y.*(x+c).^(-3))*et;

hessian=[aa ab ac;ab bb bc;ac bc cc];

end