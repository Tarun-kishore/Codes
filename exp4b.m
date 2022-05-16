%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-4: Study linear and non-linear quantization. Computer quantization error of gaussian signal.

%part b- non- linear quantization
clc;
clear all;
close all;

y=-3:0.01:3;
x = normpdf(y,0,1);

U=255;
xcomp = compand(x,U,max(x));

d = (max(xcomp) - min(xcomp))/15;

for i= 1:length(xcomp)
    start = min(xcomp);
    
    while(start < xcomp(i))
        start =start+d;
    end
   
    if(start == xcomp(i)) xq(i) = start;
    else
        xq(i) = start-d;
    end
end
subplot(2,1,1);
plot(xcomp);
hold('on');
grid ON;
plot(xq);

subplot(2,1,2);
error = xcomp-xq;
plot(error);

totalError = trapz(error);
totalError