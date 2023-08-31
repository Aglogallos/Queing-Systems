pkg load queueing;
clc;
clear all;
close all;


function Answer = erlangb_factorial (r, c) 
  a = (r^c)/factorial(c);
  b = 0;
  i = 0;
  for i = 1:1:c
      b = b + (r^c)/factorial(i);
  endfor
  Answer = a/b;  
endfunction

display(erlangb_factorial (1024, 1024));

function Answer = erlangb_iterative (r, c)
    i=0;
    Answer = 1;
    for i = 1:1:c
       Answer = r * Answer/(r * Answer + i); 
    endfor
endfunction

display(erlangb_iterative (1024, 1024));

found_answer = false;
r = 200*23/60;
c = 1:200;
for i = 1:200
  B(i) = erlangb_iterative(r,i);
  if B(i) < 0.01 && !found_answer
    answer = i;
    found_answer = true;
  endif
endfor

figure(1);
plot(c, B, "linewidth",1.4);
title("Pblocking");
xlabel("Number of Lines");


display(strjoin({"Minimum Number of Lines with Pblocking < 0.01 is", num2str(answer)}));