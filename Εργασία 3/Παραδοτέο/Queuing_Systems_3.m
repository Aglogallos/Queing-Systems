% M/M/1/10 simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;

rand("seed",1);
lambda = [1,5,10]; 
mu = 5;
figure_counter = 1;

for counter = 1:1:3
  
  arrivals = zeros(1,11);
  total_arrivals = 0; % to measure the total number of arrivals
  current_state = 0;  % holds the current state of the system
  previous_mean_clients = 0; % will help in the convergence test
  index = 0;
  P = zeros(1,11);

  threshold = lambda(counter)/(lambda(counter) + mu); % the threshold used to calculate probabilities
  
  transitions = 0; % holds the transitions of the simulation in transitions steps

  while transitions >= 0
    transitions = transitions + 1; % one more transitions step
  
    if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
      index = index + 1;
      for i=1:1:length(arrivals)
         P(i) = arrivals(i)/total_arrivals; % calculate the probability of every state in the system
      endfor
    
      mean_clients = 0; % calculate the mean number of clients in the system
      for i=1:1:length(arrivals)
        mean_clients = mean_clients + (i-1).*P(i);
      endfor
      
      Pblocking = P(11);
      g = lambda(counter)*(1-Pblocking);
      mean_wait_time = mean_clients/g;
      to_plot(index) = mean_clients;
        
      if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
        break;
      endif
    
      previous_mean_clients = mean_clients;
    
    endif
  
    random_number = rand(1); % generate a random number (Uniform distribution)
    
    %Debugging1
    if transitions <= 30
        out = strcat("Current state is: ", int2str(current_state), " and total arrivals to this state are: ", int2str(arrivals(current_state+1)));
        disp(out);
    endif
    %End of Debugging1
    
    if current_state == 0 || random_number < threshold % arrival
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
      flag = "arrival";
      if current_state < 10
        current_state = current_state + 1;
      endif
    else % departure
      if current_state != 0 % no departure from an empty system
        current_state = current_state - 1;
        flag = "departure";
      endif
    endif
  
  
    %Debugging2
    if transitions <= 30
        out = strcat("Next transition is: ", flag)
        disp(out); 
    endif
    %End of Debugging2
  endwhile
  
  out = strcat("for lamda = ", int2str(lambda(counter)));
  disp(out);
  for i=1:1:length(arrivals)
    temp1 = P(i);
    out = strcat("Probability of state ", int2str(i-1), " is: ", int2str(temp1));
    disp(out);
  endfor

  display(Pblocking);
  display(mean_clients);
  display(mean_wait_time);
  display(transitions);
  
  figure(figure_counter);
  plot(to_plot,"r","linewidth",1.3);
  title("Average number of clients in the M/M/1/10 queue: Convergence");
  xlabel("transitions in thousands");
  ylabel("Average number of clients");
  figure_counter = figure_counter + 1;
  
  figure(figure_counter);
  bar(P,'r',0.4);
  title("Probabilities")
  figure_counter = figure_counter + 1;
  clear to_plot;
endfor