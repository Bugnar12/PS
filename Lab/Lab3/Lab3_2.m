N = input("Give the number of simulations you want to happen n= ")
%each simulation recieves 3 random numbers
U = rand(3,N);
Y = (U < 0.5); %Y are heads
X = sum(Y)
clf
hist(X);
