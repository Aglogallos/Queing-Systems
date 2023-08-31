clc;
clear all;
close all;

lamda = 10 * 10^3;  %Packets/sec
C1 = 15 * 10^6;
C2 = 12 * 10^6;
a = 0.001:0.001:0.999;

mean_packet_size = 128 * 8 %Bits

%For line1 
m1 = C1 / mean_packet_size;

%For line2
m2 = C2 / mean_packet_size;

for i = 1:1:999
  r1 = (lamda*a(i)) / m1;
  r2 = (lamda*(1-a(i))) / m2;
  mean_delay_line1 = r1 / (1 - r1);
  mean_delay_line2 = r2 / (1 - r2);
  mean_total_delay(i) = (mean_delay_line1 + mean_delay_line2) / lamda;
endfor

min_delay = mean_total_delay(1);
prob_min_delay = 0;

for i = 1:1:999
  if min_delay > mean_total_delay(i)
    min_delay = mean_total_delay(i);
    prob_min_delay = i;
  endif
endfor

figure(1);
plot(a, mean_total_delay, "linewidth", 1.4);
ylabel("Mean Total Delay");
xlabel("Probability a");

display(min_delay);
display(prob_min_delay);

