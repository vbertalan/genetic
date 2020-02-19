function Bump2()
clear, clf, 
x=[0:0.001:pi];
y=[0:0.001:pi];
z=@(x,y) -sin(x)*sin(x^2/pi)^20-sin(y)*sin(2*y^2/pi)^20;
ezmeshc(z,[0,pi],100);