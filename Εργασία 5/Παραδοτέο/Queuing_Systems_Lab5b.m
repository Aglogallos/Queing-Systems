clc; 
clear all;
close all;

function [r, ergodicity] = intensities (lamda_i, m_i)
   ergodicity = 1;
   r(1) = lamda_i(1)/m_i(1);
   r(2) = (lamda_i(1)*2/7 + lamda_i(2))/m_i(2);
   r(3) = (lamda_i(1)*4/7)/m_i(3);
   r(4) = (lamda_i(1)/7 + lamda_i(1)*4/14)/m_i(4);
   r(5) = (lamda_i(1)*2/7 + lamda_i(2) + lamda_i(1)*4/14)/m_i(5);
   for i = 1:1:5
     if r(i) > 1
       ergodicity = 0;
     endif
   endfor
   %display(r);
endfunction

function Qi = mean_clients (lamda_i, m_i)
  [r_i, erg] = intensities(lamda_i, m_i);
  for i = 1:1:5
    Qi(i) = r_i(i)/(1 - r_i(i));
  endfor
endfunction

lamda = [4, 1];
m = [6, 5, 8, 7, 6];

[r, erg] = intensities(lamda, m);
Q = mean_clients(lamda, m);

sumQ=0;
for i = 1:1:5
  sumQ = sumQ + Q(i);
endfor

network_throughput=0;
for i = 1:1:2
  network_throughput = network_throughput + lamda(i);
endfor

mean_delay_time = sumQ / network_throughput;

bottleneck=1;
check = r(1);
for i = 2:1:5
  if check < r(i)
    check = r(i);
    bottleneck = i;
  endif
endfor

%Bottlencek is node 1
%To find max lamda_1, r1 must be equal to 1 (ergodicity limit)

max_lamda = m(1);
flamda = 0.1:0.01:0.99;
flamda = flamda .* max_lamda;

new_lamda = lamda;
for i = 1:1:90
  new_lamda(1) = flamda(i);
  newQ = mean_clients(new_lamda, m);
  newsumQ=0;
  for j = 1:1:5
    newsumQ = newsumQ + newQ(j);
  endfor
  new_network_throughput=0;
  for k = 1:1:2
    new_network_throughput = new_network_throughput + new_lamda(k);
  endfor
  fmean_delay_time(i) = newsumQ / new_network_throughput;
endfor

figure(1);
plot(flamda, fmean_delay_time, "linewidth", 1.4);
xlabel("lamda 1");
ylabel("Mean Delay Time");

display(r);
display(Q);
display(mean_delay_time);
display(bottleneck);

