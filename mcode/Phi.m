function [ phi ] = Phi( t,x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

phi=[0 0 0]';

phi(1)=10*(x(2)-x(1));
phi(2)=28*x(1)-x(2)-x(1)*x(3);
phi(3)=-8*x(3)/3+x(1)*x(2);

end

