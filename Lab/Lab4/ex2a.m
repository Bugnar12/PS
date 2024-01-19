N = input("The number of trials is: ");
p = input("The probability is (between 0 and 1) : ");
U = rand(1,N);
X = (U < p);

U_X = [0 1]; #only values of 0 and 1
n_X = hist(X, length(U_X)); #stores how many 0's and how many 1's
rel_freq = n_X / N
