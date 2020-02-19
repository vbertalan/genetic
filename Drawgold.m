function Drawgold()
x = [-2:0.1:2];
y = x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=gold([X(h,l),Y(h,l)]);
    end
end
surfc(X,Y,z);
shading interp

% Goldstein and Price Function
% The number of variables n = 2
% Matlab Code by A. Hedar (Sep. 29, 2005)

function y = gold(x)
a = 1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*x(1)^2-14*x(2)+6*x(1)*x(2)+3*x(2)^2);
b = 30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*x(1)^2+48*x(2)-36*x(1)*x(2)+27*x(2)^2);
y = a*b;
