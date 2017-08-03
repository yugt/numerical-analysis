function [ X ] = newton_Highdim( f,Jf,p0,delta,epsilon,max1)

X=[];
for k=1:max1
	X=[X p0];
	p1=p0-Jf(p0)\f(p0);
	err=(p1-p0)'*(p1-p0);
	p0=p1;
	y=f(p0);
	if (err<delta)||(y'*y<epsilon)
		break
	end
end

end