%%%%%% Exercise 1
dy=@(t,y) 1+y^2;
% euler(dy,0,3,0,3)
format long
for i=1:9
    temp=euler(dy,0,3,0,i);
    disp((temp(i+1,2)))
end

