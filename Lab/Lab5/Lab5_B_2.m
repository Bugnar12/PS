#X1 = Gas mileage for regular gasoline tests
X1 = [22.4 21.7 24.5 23.4 21.6 23.3 22.4 21.6 24.8 20.0];
#X2 = Gas mileage for the premium gasoline tests
X2 = [17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];

#n1 = the length of the vector X1( how many tests were conducted )
n1 = length(X1);
#n2 = the length of the vector X2( how many tests were conducted )
n2 = length(X2);

one_minus_alpha = input("Input the confidence level : "); #confidence level
alpha = 1 - one_minus_alpha; #significance level


sp = sqrt(((n1-1)*var(X1)) + ((n2-1)*var(X2))/(n1 + n2 - 2));
n1 = mean(X1) - mean(X2) - tinv(1 - alpha / 2, n1 + n2 - 2) * sp * sqrt(1/n1 + 1/n2);
n2 = mean(X1) - mean(X2) + tinv(1 - alpha / 2, n1 + n2 - 2) * sp * sqrt(1/n1 + 1/n2);

printf("The confidence interval for the difference of interval means when sigma1=sigma2=UNknown is :")
printf('(n1, n2) = (%4.3f, %4.3f)\n' , n1, n2)

c = (var(X1) / n1) / (var(X1)/n1 + var(X2) / n2);
aux = (c*c / n1 - 1) + ((1-c)*(1-c) / n2 - 1);
aux2 = (1/aux);
n = ceil(1/aux);

n1b = mean(X1) - mean(X2) - tinv(1 - alpha/2, n) * sqrt(var(X1)/n1 + var(X2)/n2);
n2b = mean(X1) - mean(X2) + tinv(1 - alpha/2, n) * sqrt(var(X1)/n1 + var(X2)/n2);

printf("The confidence interval for the difference of interval means when sigma1!=sigma2=UNknown is :")
printf('(n1b, n2b) = (%4.3f, %4.3f)\n' , n1b, n2b)

n1c = 1 / finv(1-alpha/2, n1-1, n2-2) * (var(X1) / var(X2));
n2c = 1 / finv(alpha/2, n1-1, n2-2) * (var(X1) / var(X2));

printf("The confidence interval for the ratio is:")
printf('(n1c, n2c) = (%4.3f, %4.3f)\n' , n1c, n2c)

#for Exercise 1 : NOT A MATRIX, actually values and below frequencies [20,20,20,21,21,21,21...]
#X = [20 * ones(1,3) 21*ones(1,4)
#c) - cov(X,Y) - matrix ; c = cov(X,Y,1) - 1(if you want populations)
#                         c = (1,2) - we want the coefficient from coordinates (1,2)
#d) coeff..(nu mai stiu)

X = [20 * ones(1,2), ...
     21 * ones(1,1), ...
     22 * ones(1,3), ...
     23 * ones(1,6), ...
     24 * ones(1,5), ...
     25 * ones(1,9), ...
     26 * ones(1,2), ...
     27 * ones(1,2)]
