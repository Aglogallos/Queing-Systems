pkg load queueing;
pkg load statistics;

clc;
clear all;
close all;

%U = Utilization
%R = Response Time
%Q = Average number of reguests
%X = Server throughput if ergodic X = lamda
%p0 = probability of no requests
%lamda and mu can be vectors so answer will be vector of vectors
%[U, R, Q, X, p0] = qsmm1 (lambda, mu);

%Pk probability calculation
%pk = qsmm1(lamda, mu, k);

%a. Για να είναι το σύστημα εργοδικό πρέπει να ισχύει ότι 0<ρ<1
%   άρα 0<λ/μ<1 ---> 0<λ<μ ---> μ ε (5,10] 

m = 5.01:0.01:10;
l = zeros(1,500);

l = 5 .+ l;

[U, R, Q, X, p0] = qsmm1(l, m);

figure(1);
hold on;
plot(m, U, "linewidth", 1.3);
title("Utilization with different m")
xlabel("m");
ylabel("Utilization");
hold off;


figure(2);
hold on;
plot(m, R, "linewidth", 1.3);
title("Response time with different m")
xlabel("m");
ylabel("Response Time");
hold off;


figure(3);
hold on;
plot(m, Q, "linewidth", 1.3);
title("Average number of requests with different m")
xlabel("m");
ylabel("Average number of requests");
hold off;


figure(4);
hold on;
plot(m, X, "linewidth", 1.3);
title("Throughput with different m")
xlabel("m");
ylabel("Throughput");
hold off;