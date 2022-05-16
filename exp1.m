
%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-1: TO PLOT A SPECTRUM OF PULSE OF WIDTH 10

clc;
clear all;
close all;
 
syms t w;

x=1;
expw = exp(-j*w*t);

z = int(x*(exp(-j*w*t)),t,-5,5);

z = simplify(z);

subplot(2,1,1);

ezplot('1',[-5,5]);

axis([-6 6 0 2]);

subplot(2,1,2);
ezplot(z);

axis([-5 5 -3 11]);
