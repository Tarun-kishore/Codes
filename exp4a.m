%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-4: Study linear and non-linear quantization. Computer quantization error of gaussian signal.

%part a- linear quantization

clc;
clear all;
close all;

y=-3:0.01:3;
x = normpdf(y,0,1);

d = (max(x) - min(x))/15;

for i= 1:length(x)
    start = min(x);
    
    while(start < x(i))
        start =start+d;
    end
   
    if(start == x(i)) xq(i) = start;
    else
        xq(i) = start-d;
    end
end
subplot(2,1,1);
plot(x);
hold('on');
grid ON;
plot(xq);

subplot(2,1,2);
error = x-xq;
plot(error);

totalError = trapz(error);
totalError