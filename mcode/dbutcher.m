function [ df ] = dbutcher( t,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
df=[0 0 0 0];

df(1)=1+2*t/sqrt(1+2*t^2);
df(2)=2/sqrt(1+2*t^2)^3;
df(3)=-12*t/sqrt(1+2*t^2)^5;
df(4)=12*(8*t^2-1)/sqrt(1+2*t^2)^7;

end

