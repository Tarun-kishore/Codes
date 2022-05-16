%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-2 c: To verify convolution property of fourier transform
clc;
clear all; 
close all;
x = [ones(1,5),zeros(1,16)];
h = [ones(1,10),zeros(1,11)];;

N = length(x);
M = length(h);

y= zeros(1,N);
y=h.*x;

subplot(2,1,1);
plot(y);

syms w t;
z1=fft(x);
z2=fft(h);
plot(abs(fft(y)));
title('fourier transform of x * h');
subplot(2,1,2);
z=1/21* cconv(z1,z2,21);

plot(abs(z));

title('convolution fourier transform of x  and h');