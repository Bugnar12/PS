%Size of the nickel particles represented as a vector X
X = [3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96];
%The length of the vector X described by n
n = length(X);
%Mean of X
m = mean(X);
%Variance of X
v = var(X) #note : square root of var(X) = std(X) (standard deviation of X)
v1 = cov(X)
s = std(X);

%a)95% confidence interval for the average size of nickel particles
%Sigma is unknown and we have only one population , so
alpha = input("Please input the significance level " );
one_minus_alpha = 1 - alpha; %the confidence level which is given to be 0.95 (95%)

t = tinv(1 - alpha/2, n-1); %Student T inverse cumulative distribution function
%Now determine the confidence intervals
left_side = m - (s / sqrt(n) * t);
right_side = m + (s / sqrt(n) * t);

printf("The confidence interval at 95 percent confidence level is : (%6.4f, %6.4f)\n", left_side, right_side);

%b)At 1% significance level, do these particles seem to be smaller than 3 on average?
%We must perform a left tailed test, and 3 will be considered the test value
%We have only one population so we will use ttest ; alpha will be the significance level(0.01)

m0 = 3; %The test value
[H, P, CI, STATS] = ttest(X, m0, 'alpha', alpha, 'tail', 'left');

if H == 0
  printf("\nThe null hypothesis is not rejected!\n")
  printf("The particles do not seem smaller than 3 on average!\n")
else
  printf("\nThe null hypothesis is rejected!\n")
  printf("The particles seem smaller than 3 on average!\n")
endif

t1 = tinv(alpha, n-1);
printf("The rejection region is : (%6.4f, %6.4f)\n", -Inf, t1)
printf("The P-value of the test is %6.4f : \n", P)
printf("The confidence interval is : (%6.4f, %6.4f)\n", CI)
printf("The test statistics value is : %.4f\n", STATS.tstat)
