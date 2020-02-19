function DrawSumS()
x=[-10:0.1:10];
y=x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=SumS([X(h,l),Y(h,l)]);
    end
end
surfc(X,Y,z);
shading interp

% Sum Squares function
% Matlab Code by A. Hedar (Nov. 23, 2005)
% The number of variables n should be adjusted below.
% The default value of n = 20.

function y = SumS(x)
n = 2;
s = 0;
for j = 1:n
    s=s+j*x(j)^2;
end
y = s;
