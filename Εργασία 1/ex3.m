clc;
clear all;
close all;

pkg load statistics;

# -> Question 3.A <- 
x = exprnd(0.2,1,100);
y = ones(100,1);
for i=1:99
  x(i+1)=x(i+1)+x(i);
  y(i+1)=y(i+1)+y(i);
 endfor
 figure(1);
 stairs(x,y, color=	'm');
 title("Counting Process Poisson with 5 events/s");
 xlabel("seconds");
 ylabel("N(t)");

# -> Question 3.B <-

  # <i>
x = exprnd(0.2,1,200);
y = ones(200,1);
for i=1:199
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor
 figure(2);
stairs(x,y, color=	'm');
title("Counting Process Poisson with 5 events/s for 200 events");
xlabel("seconds");
ylabel("N(t)");
display("200/x(200)=");
display(200/x(200));

  # <ii>
x = exprnd(0.2,1,300);
y = ones(300,1);
for i=1:299
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor
 figure(3);
stairs(x,y, color=	'm');
title("Counting Process Poisson with 5 events/sec for 300 events");
xlabel("seconds");
ylabel("N(t)");
display("300/x(300)=")
display(300/x(300));

  # <iii>
x = exprnd(0.2,1,500);
y = ones(500,1);
for i=1:499
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor
 figure(4);
stairs(x,y, color=	'm');
title("Counting Process Poisson with 5 events/sec for 500 events");
xlabel("seconds");
ylabel("N(t)");
display("500/x(500)=");
display(500/x(500));

  # <iv>
x = exprnd(0.2,1,1000);
y = ones(1000,1);
for i=1:999
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor
 figure(5);
stairs(x,y, color=	'm');
title("Counting Process Poisson with 5 events/sec for 1000 events");
xlabel("seconds");
ylabel("N(t)");
display("1000/x(1000)=");
display(1000/x(1000));

  # <v>
x = exprnd(0.2,1,10000);
y = ones(10000,1);
for i=1:9999
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor
 figure(6);
stairs(x,y, color=	'm');
title("Counting Process Poisson with 5 events/sec for 10000 events");
xlabel("seconds");
ylabel("N(t)");
display("10000/x(10000)=");
display(10000/x(10000));