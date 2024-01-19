pkg load statistics

%the number of trials is known to be 3
%a) the probability law that x follows is the binomial law
%n = 3
%x = 0:1:n
%p = 0.5

%x is the number of successes
x = 0:1:3;
px = binopdf(x,3,0.5)

%The values of X are  0   1   2   3
%The probabilities : 1/8 3/8 3/8 1/8
