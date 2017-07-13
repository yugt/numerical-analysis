function [ L ] = Chol( A )
[n,n]=size(A);
for k=1:n-1
    A(k,k)=sqrt(A(k,k));
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=k+1:n,
        A(j:n,j)=A(j:n,j)-A(j:n,k)*A(j,k);
    end
end
A(n,n)=sqrt(A(n,n));
L = tril(A);
return
end