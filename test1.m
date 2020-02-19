function f=test1(X)
siz=size(X);
for i=1:siz(1)
    temp=norm(X(i,:));
    f(i)=(sin(temp).^2-0.5)/(1+0.001*(temp.^2)).^2-0.5;
end

