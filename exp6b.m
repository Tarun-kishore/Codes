%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-6: GIVEN IS A LINEAR BLOCK CODE WITH THE GENERATOR MATRIX g
%G =
%1 1 0 0 1 0 1
%0 1 1 1 1 0 0
%1 1 1 0 0 1 1
%A. CALCULATE THE NUMBER OF VALID CODE WORDS N. SPECIFY THE COMPLETE CODE
%SET C.
%B. PERFORM FOR SYSTEMATIC LINEAR BLOCK(G').

%Code for part B

clc;
close all;
clear all;

G=[1,1,0,0,1,0,1;0,1,1,1,1,0,0;1,1,1,0,0,1,1];

G(3,:) = mod(G(1,:) + G(3,:),2);
G(2,:) = mod(G(2,:) + G(3,:),2);
G(1,:) = mod(G(1,:) + G(2,:),2);

k=size(G);
n=k(1,2);
k=k(1,1);

m = [];
for x = 0:2^k-1
    m=[m(:,:);dec2bin(x,k)];
end

codeword = [];
for i = 1:2^k
    c = mod(m(i,:)*G,2);
    codeword = [codeword(:,:);c];
end

codeword




