function [p0,err,k,y]=newton_Modified(f,df,p0,m,delta,epsilon,max1)

%Input    - f is the object function 
%            - df is the derivative of f 
%            - p0 is the initial approximation to a zero of f
%            - m is the order of the root
%	         - delta is the tolerance for p0
%	         - epsilon is the tolerance for the function values y
%	         - max1 is the maximum number of iterations
%Output - p0 is the Newton-Raphson approximation to the zero
%	         - err is the error estimate for p0
%	         - k is the number of iterations
%	         - y is the function value f(p0)

%If f and df are defined as M-file functions use the @ notation
% call [p0,err,k,y]=newton(@f,@df,p0,delta,epsilon,max1).
%If f and df are defined as anonymous functions use the
% call  [p0,err,k,y]=newton(f,df,p0,delta,epsilon,max1).


%  NUMERICAL METHODS: Matlab Programs
% (c) 2004 by John H. Mathews and Kurtis D. Fink
%  Complementary Software to accompany the textbook:
%  NUMERICAL METHODS: Using Matlab, Fourth Edition
%  ISBN: 0-13-065248-2
%  Prentice-Hall Pub. Inc.
%  One Lake Street
%  Upper Saddle River, NJ 07458

for k=1:max1
    disp(k)
	p1=p0-m*f(p0)/df(p0)
	err=abs(p1-p0)
	relerr=2*err/(abs(p1)+delta);
	p0=p1;
	y=f(p0);
	if (err<delta)||(relerr<delta)||(abs(y)<epsilon)
		break
	end
end