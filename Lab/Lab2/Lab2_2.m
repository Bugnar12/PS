pkg load statistics

%We ask the user to input the
%required values for the binomial

n = input("Give the nb. of trials n= ")
p = input("Give the prob. of success p = ")

%n is a natural number
%p is a value between 0 and 1
%x is the nb. of successes, x - values for the pdf

x=0:1:n;
px = binopdf(x, n, p)
plot(x,px,'r+')

% so that the graphs do not override
hold on
%to give values for the CDF
%you must always "simulate continuity"
xx = 0:0.01:n
fx = binocdf(xx, n, p);
plot(xx, fx, 'b')
legend %for putting together the 2 graphs

