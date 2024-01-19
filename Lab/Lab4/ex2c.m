#count the failures !!! important
N = input("Please enter the number of simulations is: ")
p = input("Please enter the probability which is (between 0 and 1) : ")

B_X = [0:N]
#For each element from the vector X, we set it to be 0, and if a random nr. is higher than probability p => failure
#Failure => we increment the element at the i-th position ; thus we compute the random nr. of failures
for i=1:N;
  X(i) = 0
  while(rand>=p)
    X(i) = X(i) + 1;
  endwhile
endfor

k=0:20;
p_k = geopdf(k, p); %compute the geometric pdf
U_X = unique(X);

#Rest of the problem is like previous ones

n_X = hist(X, length(U_X));
rel_freq = n_X / N;
clf
plot(U_X, rel_freq, '*', k, p_k, 'ro')
