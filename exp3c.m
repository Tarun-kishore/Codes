%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-3 : STUDY OF UNIFORM, EXPONENTIAL AND GAUSSIAN DISTRIBUTED
%RANDOM VARIABLES. DRAW THEIR PDF AND CDF.
%c. for exponential ditribution
clc
clear
close all

N=1000000;
x= ones(1,N);
x = exprnd(x);
mu=mean(x); 
sigma2=var(x);
step=0.1;
range=-3:step:3; 
h=histc(x,range);
b=1;
a=0;
N=size(h);
N = N(1,2);
X=0:0.01:3;
f=exp(-X);

subplot(2,1,1);
plot(0:0.01:3,f,'linewidth',2);

axis([-3 3 0 1.2])
hold('on');
simulatedPDF=h./(step.*sum(h));
plot(range,simulatedPDF,'*','markersize',15)
title('Exponential Distribution')
xlabel('Range');
ylabel('PDF');

legend('Theoretical','Simulated');


subplot(2,1,2)
syms t z;
syms X;
f=exp(-X);
p= int(f,X,0,z);

fplot(p,'b','linewidth',2);

hold ('on');
simulatedCDF=zeros(1,N);
simulatedCDF(1) = h(1)/sum(h);
for i = 2:N
    simulatedCDF(i) = simulatedCDF(i-1) + h(i)/sum(h);
end;
plot(range,simulatedCDF,'*','markersize',15)
axis([-3 3 0 1.2])
title('Exponential Distribution')
xlabel('Range');
ylabel('CDF');
legend('Theoretical','Simulated');
