%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-3 : STUDY OF UNIFORM, EXPONENTIAL AND GAUSSIAN DISTRIBUTED
%RANDOM VARIABLES. DRAW THEIR PDF AND CDF.
%b. for uniform ditribution
clc
clear
close all

N=1000000;
x=rand(1,N);
mu=mean(x); 
sigma2=var(x);
step=0.1;
range=-3:step:3; 
h=histc(x,range);
b=1;
a=0;
N=size(h);
N = N(1,2);
syms X;
f=rectangularPulse(a,b,X);

subplot(2,1,1);
fplot(f,'linewidth',2);

axis([-3 3 0 1.2])
hold('on');
simulatedPDF=h./(step.*sum(h));
plot(range,simulatedPDF,'*','markersize',15)
title('Uniform Distribution')
xlabel('Range');
ylabel('PDF');

legend('Theoretical','Simulated');


subplot(2,1,2)
syms t z;
p= int(f,X,-3,z);

fplot(p,'b','linewidth',2);

hold ('on');
simulatedCDF=zeros(1,N);
simulatedCDF(1) = h(1)/sum(h);
for i = 2:N
    simulatedCDF(i) = simulatedCDF(i-1) + h(i)/sum(h);
end;
plot(range,simulatedCDF,'*','markersize',15)
axis([-3 3 0 1.2])
title('Uniform Distribution')
xlabel('Range');
ylabel('CDF');
legend('Theoretical','Simulated');
