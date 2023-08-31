clc;
clear all;
close all;
pkg load statistics;

# -> Question 2.A <-

k = 0:0.0001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  exp(i,:) = exppdf(k,lambda(i));
endfor

colors="rgb";
figure(1);
hold on;
for i=1:columns(lambda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Density Function of Exponential distribution");
xlabel("k values");
ylabel("Probability");
legend("lambda=0.5","lambda=1","lambda=3");

# -> Question 2.B <-

k = 0:0.0001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  exp(i,:) = expcdf(k,lambda(i));
endfor

colors="rgb";
figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Cumulative Function of Exponential distribution");
xlabel("k values");
ylabel("Probability");
h = legend("lambda=0.5","lambda=1","lambda=3");
legend(h,"location","southeast");

# -> Question 2.C <-

k = 0:0.00001:8;

exp = expcdf (k,2.5);
P = 1 - exp(30000);
display(P);
Pr = (1-exp(50000))./(1-exp(20000));
display(Pr);






