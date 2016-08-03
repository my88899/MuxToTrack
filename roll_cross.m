function ot=roll_cross(p,r)
x=[];y=[];z=[];
for i=1:3
    x=[x,p{i}(1)];
    y=[y,p{i}(2)];
    z=[z,p{i}(3)];
end
syms X Y Z
% [X,Y,Z]=solve('(X-x(1))^2+(Y-y(1))^2+(Z-z(1))^2=r(1)^2','(X-x(2))^2+(Y-y(2))^2+(Z-z(2))^2=r(2)^2','(X-x(3))^2+(Y-y(3))^2+(Z-z(3))^2=r(3)^2','X','Y','Z')%'X, Y, Z')%
% plot3(X,Y,Z)
ot=solve(r(1)^2==(X-x(1))^2+(Y-y(1))^2+(Z-z(1))^2,r(2)^2==(X-x(2))^2+(Y-y(2))^2+(Z-z(2))^2,r(3)^2==(X-x(3))^2+(Y-y(3))^2+(Z-z(3))^2);
w=find(ot.X<0);
ot.X(w)=[];ot.Y(w)=[];ot.Z(w)=[];



