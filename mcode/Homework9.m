%%%%%% Exercise 1
dy=@(t,y) 1+y^2;
% euler(dy,0,3,0,3)
format long
for i=1:9
    temp=euler(dy,0,3,0,i);
    disp((temp(i+1,2)))
end

%      3
% 
%    6.375000000000000
% 
%     13
% 
%   28.404234389774501
% 
%   71.073212236802789
% 
%      2.181344382569777e+02
% 
%      8.937891513340965e+02
% 
%      5.455818281020568e+03
% 
%      5.729541345952547e+04