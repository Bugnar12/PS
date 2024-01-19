%The first vector represents the standard method
X = [46, 37, 39, 48, 47, 44, 35, 31, 44, 37];
%The second vector represents the new method
Y = [35, 33, 31, 35, 34, 30, 27, 32, 31, 31];

%n1 and n2 are the lengths of each vector
n1 = length(X);
n2 = length(Y);

%m1 and m2 are the means of each vector( in case they are needed )
m1 = mean(X);
m2 = mean(Y);

%v1 and v2 are the variances of each vector ( in case they are needed )
v1 = var(X);
v2 = var(Y);

s1 = std(X);
s2 = std(Y);

printf("A)\n")
printf("The null hypothesis H0 is described by the population variances being equal\n")
printf("The alternative hypothesis H1 is described by the population variances being different\n")

alpha = input("Please input the significance level (0.05 according to the problem): ");
%We want to compare the variances so we will perform a vartest2
[H, P, CI, STATS] = vartest2(X, Y, 'alpha', alpha);

if H == 0
  printf("\nThe null hypothesis is not rejected!\n")
  printf("The variances are just about the same!\n")
else
  printf("\nThe null hypothesis is rejected!\n")
  printf("The variances of the 2 populations seem to differ!\n")
endif

f1 = finv(alpha/2, n1-1, n2-1);
f2 = finv(1 - alpha/2, n1-1, n2-1);

printf("The rejection region is :(%.6f, %.6f) U (%.6f, %.6f)\n", -Inf, f1, f2, Inf)
printf("The P value of the test is %.6f\n", P)
printf("The confidence interval for the test is : (%.6f, %.6f)\n", CI)
printf("The statistics test value is %.6f\n", STATS.fstat)


printf("B)\n")
printf("Compute the difference of means when sigmas are unknown and different => 3rd case 3rd point\n");
if H == 0
  n = n1 + n2 - 2;
  t = tinv(1-alpha/2, n);
  sp = sqrt(((n1-1)*v1 + (n2-1)*v2)/n);
  left = m1 - m2 - t * sp * sqrt(1/n1 + 1/n2);
  right = m1 - m2 + t * sp * sqrt(1/n1 + 1/n2);
else
  c = (v1/n1)/(v1/n1+v2/n2);
  n = c^2/(n1-1)+(1-c)^2/(n2-1);
  n = 1/n;
  t = tinv(1-alpha/2, n);
  left = m1-m2-t*sqrt(v1/n1+v2/n2);
  right = m1-m2+t*sqrt(v1/n1+v2/n2);
end

[H1, P1, CI1, STATS1] = ttest2(X, Y, 'alpha', alpha, 'vartype', "equal");
printf("The 95 confidence interval is (%.4f, %.4f)\n", left, right)
