%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-5: STUDY OF PASSBAND DIGITAL COMMUNICATION TECHNIQUE BPSK.
%CALCULATE THE BER OF BPSK MODULATED SIGNAL.

clc;
clear;
close all;

N = 10^6;
a = rand(1,N)>0.5;
s = 2*a -1;
snr_dB = 1:1:10;
snr_ratio = 10.^snr_dB/10;
n = 1/sqrt(2).*randn(1,N);
for i = 1:length(snr_dB)
 y = 10^(snr_dB(i)/20).*s + n;
 a_dec = real(y)>0;
 nErr(i) = size(find(a-a_dec),2);
end
simBer = nErr/N;
theoryBer = 0.5*erfc(sqrt(10.^(snr_dB/10)));
figure
semilogy(snr_dB, theoryBer, 'b-', 'LineWidth', 1.5);
hold('on')
semilogy(snr_dB, simBer, 'x' ,'MarkerSize', 8);
grid ON
legend('theory', 'simulation');
xlabel('snr_dB -->');
ylabel('Bit Error Rate -->');
title('Bit Error Probability Curve for BPSK Modulation');