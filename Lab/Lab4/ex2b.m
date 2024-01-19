N = input("Please enter the number of simulations: ")
p = input("Please enter the probability which is (between 0 and 1) : ")
n = input("Input the number of trials : ")

U = rand(n, N); #a 5x20 matrix, each cell having between 0 and 1 ( 5 trials per each simulation)
X = sum(U < p) #X is a vector, where each cell represents how many elements from a column were LOWER than p

k = 0:n; #vector from 0 to n
p_k = binopdf(k, n, p); #the binopdf for k elements in n trials with probability p(probability that exactly k events are successful)
U_X = unique(X) #gets only the unique elements from a vector, ascendingly

n_X = hist(X, length(U_X))
rel_freq = n_X / N;
clf
plot(U_X, rel_freq, '*', k, p_k, 'ro')
#plot 2 graphs : first has U_X on x-axis which is the unique number of binos(the higher probability the higher the numbers)
#and on the y-axis rel_freq which is the ratio between the frequency of X elementds and the total number of simulations(columns)
