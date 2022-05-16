%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-2 b: To verify frequency shifting fourier transform property
clc;
clear all;
close all;
 
syms t w;

w0 = 2;
x=1;
z = int(x*(exp(-j*w*t)),t,-5,5);

z = simplify(z);

z2 = int(exp(j*w0*t)*x*(exp(-j*w*t)),t,-5,5);

z2 = simplify(z2);

subplot(4,1,1);

ezplot('1',[-5,5]);

axis([-6 6 0 2]);

subplot(4,1,2);
ezplot(z);
axis([-5 5 -3 11]);
title('x(w)');

subplot(4,1,3);
z=subs(z,w,w-w0);
z= simplify(z);
ezplot(sqrt(real(z)^2 + imag(z)^2));
axis([-5 7 -3 11]);
title('Magnitude of x(w-w0)');

subplot(4,1,4);
ezplot(sqrt(real(z2)^2 + imag(z2)^2));
title('Magnitude of  fourier transform of ( e\^(j*w*t0) *x(t))');
axis([-5 7 -3 11]);