% ha_bump.m
clear all
clc
fun='Bump';
di=20;
dom=[zeros(1,di);10*ones(1,di)];
%cla=4
cla=1;
%num=5;
num=20;
%r=2*[0.5 0.6 0.7 1];
r=2;
%keep=8;
keep=32;
cr=0.98;
n_iter=100;
%optional in GA
maxit1=10;
mutrate1=1.0;
maxit2=20;
mutrate2=0.7;
selection=0.5;
%----------------------------
[cost,par]=ha(fun,di,dom,cla,num,r,keep,cr,n_iter,maxit1,mutrate1,maxit2,mutrate2,selection);
