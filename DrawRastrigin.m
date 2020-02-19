function DrawRastrigin()
x=[-5:0.05:5];
y=x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
for l=1:col
    for h=1:row
        z(h,l)=Rastrigin([X(h,l),Y(h,l)]);
    end
end
surfc(X,Y,z);
shading interp

function y=Rastrigin(x)
[row,col]=size(x);
if row>1
    error('Row has to be greater than 1');
end
y=sum(x.^2-10*cos(2*pi*x)+10);
y=-y;