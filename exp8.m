%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-7: Configure and study ring topology
clc
clear
close all

x = [1 2 3 4 5];
y = circshift(x,1);
G=graph(x,y);
plot(G);
title("Ring Topology");