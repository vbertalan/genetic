% ha_test1.m
clear all
clc
fun='test1';
di=2;
dom=[-100*ones(1,di);100*ones(1,di)];
%cla=4
cla=1;
%num=5;
num=10;
%r=2*[0.5 0.6 0.7 1];
r=2;
%keep=8;
keep=16;
cr=0.95;
n_iter=30;
%optional in GA
maxit1=10;
mutrate1=1.0;
maxit2=20;
mutrate2=0.7;
selection=0.5;
%----------------------------
[cost,par]=ha(fun,di,dom,cla,num,r,keep,cr,n_iter,maxit1,mutrate1,maxit2,mutrate2,selection);
