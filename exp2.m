%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-2 a: To verify time shifting fourier transform property
clc;
clear all;
close all;
 
syms t w;

t0 = 1;
x=1;
z = int(x*(exp(-j*w*t)),t,-5,5);

z = simplify(z);

z2 = int(x*(exp(-j*w*t)),t,-5+t0,5+t0);

z2 = simplify(z2);

subplot(4,1,1);

ezplot('1',[-5,5]);

axis([-6 6 0 2]);

subplot(4,1,2);
ezplot(z);
axis([-5 5 -3 11]);
title('fourier transform or x(t)');

subplot(4,1,3);
ezplot(sqrt(real(z2)^2 + imag(z2)^2));
axis([-5 5 -3 11]);
title('Magnitude of fourier transform of x(t-5)');

z=z*exp(-j*w*t0);
z= simplify(z);

subplot(4,1,4);
ezplot(sqrt(real(z)^2 + imag(z)^2));
title('Magnitude of e\^(-j*w*t0) * fourier transform of x(t)');
axis([-5 5 -3 11]);