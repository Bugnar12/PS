%Weights of bottles from the first supplier
X = [1021, 980, 1017, 988, 1005, 998, 1014, 985, 1014, 985, 995, 1004, 1030, 1015, 995, 1023];
%Weights of bottles from the second supplier
Y = [1070, 970, 993, 1013, 1006, 1002, 1014, 997, 1002, 1010, 975,1005, 998, 1014, 985, 1014];

n1 = length(X); %length of the first vector
n2 = length(Y); %length of the second vector

v1 = var(X);
v2 = var(Y);

alpha = input("Input the significance level (between 0 and 1) :");
%a)we have a significance level of 5% and we want to see if variances differ
%=> will perform a vartest2 on the 2 populations

[H, P, CI, STATS] = vartest2(X, Y, 'alpha', alpha);
%we also need to see which is our rejection region which is computed using finv( inverse of F cumulative function )

f1 = finv(alpha/2, n1-1, n2-1);
f2 = finv(1-alpha/2, n1-1, n2-1);

%We check whether the null hypothesis was rejected and print the corresponding message
%H0 => null hypothesis is not rejected => same variances
%H1 => null hypothesis is rejected => variances are not the same
if H == 0
  printf("\nThe null hypothesis is not rejected!\n")
  printf("The variances are approximately the same!\n")
else
  printf("\nThe null hypothesis is rejected!\n")
  printf("The variances approximations are not the same!\n")
endif

printf("The rejection interval is : (%6.4f, %6.4f) U (%6.4f, %6.4f)\n", -Inf, f1, f2, Inf)
printf("The P-Value for the test is : %6.4f\n", P)
printf("The test statistics for the F test is : %6.4f\n", STATS.fstat)
printf("The confidence interval is (%6.4f, %6.4f)\n", CI)

%b)Does supplier A seem to be more reliable?
%We need to compare the 2 means and check if mean(X) > mean(Y)

%If the variances are not equal => mean(X) > mean(Y) => perform a right-tailed test afterwards
%If the variances are equal => the means must be equal => mean(X) = mean(Y)

if H == 0
  type = "equal";
  n = n1 + n2 - 2;
else
  type = "unequal";
  c = (v1/n1) / (v1/n1 + v2/n2);
  n = (c*c / n1-1) + ((1-c)*(1-c) / n2-1);
  n = 1/n;
endif
%At this point, we know if the variances are equal or not, and have computed n for the right tailed test and tinv

[H1, P1, CI1, STATS1] = ttest2(X, Y, 'alpha', alpha, 'tail', 'right', 'vartype', type); %perform a ttest2
if H1 == 0
  printf("The null hypothesis is not rejected!\n")
  printf("The means of the 2 populations are equal!\n")
else
  printf("The null hypothesis is rejected!\n")
  printf("The mean of the supplier A is greater than the mean of the supplier B!\n")
endif

t = tinv(1-alpha, n)
printf("The rejection region is (%6.4f, %6.4f)\n", t, Inf)
printf("The P-Value is %6.4f\n", P1)
printf("The confidence interval is (%6.4f, %6.4f)\n", CI1)
printf("The test value for the T test(Student T) is : %6.4f\n", STATS1.tstat)


