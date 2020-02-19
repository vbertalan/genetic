function DrawAckley()
x=[-30:0.5:30];
y=x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=Ackley([X(h,l),Y(h,l)]);
    end
end
surfc(X,Y,z);
shading interp

% Michalewicz function
% Matlab Code by A. Hedar (Nov. 23, 2005)
% The number of variables n should be adjusted below.
% The default value of n = 2.
function y = Ackley(x)

n = 2;
a = 20; b = 0.2; c = 2*pi;
s1 = 0; s2 = 0;

for i=1:n;
    s1 = s1+x(i)^2;
    s2 = s2+cos(c*x(i));
end
y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);