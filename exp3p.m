%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-3 : STUDY OF UNIFORM, EXPONENTIAL AND GAUSSIAN DISTRIBUTED
%RANDOM VARIABLES. DRAW THEIR PDF AND CDF.
%a. for gaussian ditribution
clc
clear
close all

N=1000000;
x=randn(1,N);
mu=mean(x); 
sigma2=var(x);
step=0.1;
range=-3:step:3; 
h=histc(x,range);
f=((1./(sqrt(2.*pi.*sigma2))).*exp((-(range-mu).^2)./(2.*sigma2)));
subplot(2,1,1);
plot(range,f,'b','linewidth',2);
hold('on');
simulatedPDF=h./(step.*sum(h));
plot(range,simulatedPDF,'*','markersize',15)
hold on;
grid on;
axis([-3 3 0 max(simulatedPDF)])
title('Gaussian Distribution')
xlabel('Range');
ylabel('PDF'); legend('Theoretical','Simulated');


subplot(2,1,2);
syms t;
N=size(h);
N = N(1,2);

syms t z;
p= (1./(sqrt(2*pi)))*int(exp(-(t*t/2)),t,-3,z);

fplot(p,'linewidth',2);
hold('on');

simulatedCDF=zeros(1,N);
simulatedCDF(1) = h(1)/(sum(h));
for i = 2:N
    simulatedCDF(i) = simulatedCDF(i-1) + h(i)/(sum(h));
end;
plot(range,simulatedCDF,'*','markersize',15)
axis([-3 3 0 max(simulatedCDF)])
title(' CDF of Gaussian Distribution')
xlabel('Range');
ylabel('CDF');
legend('Theoretical','Simulated');