%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-2 a: To verify time shifting fourier transform property
clc
clear
close all

N=1000000;
x=randn(1,N);
mu=mean(x); sigma2=var(x); step=0.1;
range=-3:step:3; h=histc(x,range);
f=((1./(sqrt(2.*pi.*sigma2))).*exp((-(range-mu).^2)./(2.*sigma2)));
figure;
plot(range,f,'b','linewidth',2);
hold on;
simulatedPDF1=h./(step.*sum(h));
plot(range,simulatedPDF1,'*','markersize',15)
% hold on bar(range,approxPDF1)
% axis([-3 3 0 max(simulatedPDF1)])
title('Gaussian Distribution')
xlabel('Range');
ylabel('PDF'); legend('Theoretical','Simulated','Theoretical')