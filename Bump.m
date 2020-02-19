function Bump()
clear, clf,
a=0; b=10; n=100; eps1=0.01;
x=linspace(a,b,n);
y=linspace(a,b,n);
[X,Y]=meshgrid(x,y);
for i=1:n
    for j=1:n
        if (X(i,j)*Y(i,j))<0.75
            z(i,j)=NaN;
        elseif (X(i,j)+Y(i,j))>7.5*2
            z(i,j)=NaN;
        else
            temp0=cos(X(i,j))^4+cos(Y(i,j))^4;
            temp1=2*(cos(X(i,j))^2)*(cos(X(i,j))^2);
            temp2=sqrt(X(i,j)^2+2*Y(i,j)^2);
            z(i,j)=-abs((temp0-temp1)/temp2);
        end
    end
end
% zz=ones(1,n); plot3(x,x,zz),grid off,hold on
surfc(X,Y,z)
xlabel('x'),ylabel('y'),zlabel('z') % box on
shading interp