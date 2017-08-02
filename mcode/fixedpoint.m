function [ P ] = fixedpoint( g,p0,tol,max1 )

P=zeros(max(size(p0)),max1);
P(:,1)= p0;

for k=2:max1
	P(:,k)=g(P(:,k-1));
    dif=P(:,k)-P(:,k-1);
	err=sqrt(dif'*dif);
    if (err<tol)
        break;
    end
end

P=P(:,1:k);

end

