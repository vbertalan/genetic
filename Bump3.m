function Bump3()
clear all
x=0:0.02:10;
y=0:0.02:10;
[m n]=size(x);
[l m]=size(y);
for i=1:n
    for j=1:m
        if (X(i,j)*Y(i,j))<0.75
            z(i,j)=0;
        elseif (X(i,j)+Y(i,j))>7.5*2
            z(i,j)=0;
        else
            temp0=cos(x(i))^4+cos(y(j))^4;
            temp1=2*(cos(x(i)^2))*(cos(y(j))^2);
            temp2=sqrt(x(i)^2+2*y(j)^2);
            z(i,j)=abs((temp0-temp1)/temp2);
        end
    end
end
meshc(x,y,z);
figure(2)
contour(x,y,z)