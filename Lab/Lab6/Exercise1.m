X = [7 7 4 5 9 9 ...
4 12 8 1 8 7 ...
3 13 2 1 17 7 ...
12 5 6 2 1 13 ...
14 10 2 4 9 11 ...
3 5 12 6 10 7];
n = length(X);

alpha = input("Enter the significance level : ");
#The null hypothesis H0 : miu = 8.5(its considered together with miu > 8.5 ; the standard is met)
#The alternative hypothesis H1 : miu < 8.5(the standard is not met)
#Left tailed test for the mean

printf("This is a left tailed test for the mean when sigma is known\n")
sigma = 5;
m0 = 8.5; #The test value
[H, PVAL, CI, ZVALUE] = ztest(X, m0, sigma, "alpha", alpha, "tail", "left");

z_alpha = norminv(alpha, 0, 1);
RR = [-inf, z_alpha];
printf("The age is : %d\n", H);

if(H == 1)
  printf("The null hypothesis is rejected!\n");
  printf("The data suggests that the standard is not met!\n");
else
  printf("The null hypothesis is not rejected!\n");
  printf("The data suggests that the standard is met!\n");
endif

printf("The rejection region is : (%4.3f,%4.3f)\n", RR);
printf("The observed value of the tests statistics : %4.3f\n", ZVALUE);
printf("The pvalue of the test is : %4.3f\n", PVAL);



#1b) ttest instruction : right tailed test for the mean (sigma unknown)

m1 = 5.5;
printf("This is a right tailed test for the mean when sigma is not known\n");
[H1, PVAL1, CI1, ZVALUE1] = ttest(X, m1, "alpha", alpha, "tail", "right");

if(H1 == 1)
  printf("The null hypothesis is rejected!\n");
else
  printf("The null hypothesis is not rejected!\n");
endif

RR1 = [tinv(1-alpha, n-1), Inf];
printf('\nThe confidence interval for mu is (%4.3f , %4.3f)\n', CI1)
printf('\nThe rejection region is (%4.3f, %4.3f)\n', RR1)
printf('\nThe observed value of the test statistic is %4.3f\n', ZVALUE1.tstat) #ZVALUE1.tstat is the RELEVANT observation here
printf('\nThe P-Value of the test is %4.3f\n', PVAL1)


#2a) vartest2 instruction : two tailed test for comparing variances( sigma1 != sigma2 )
#The variances seem to be equal

alpha = input("Please input alpha : ") #the significance level

X = [22.4 21.7 24.5 23.4 21.6 23.3 22.4 21.6 24.8 20.0];
Y = [17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];

n1 = length(X); #how many premium fuel tests were conducted
n2 = length(Y); #how many normal fuel tests were conducted

m1 = mean(X);
m2 = mean(Y); #means for the 2 tests

v1 = var(X);
v2 = var(Y); #variances for the 2 tests

f1 = finv(alpha / 2, n1-1, n2-1);
f2 = finv(1-alpha/2, n1-1, n2-1);
[H, P, CI, STATS] = vartest2(X, Y, "alpha", alpha, "tail", "both"); #perform the test using vartest2

printf("\nThe rejection region is : (%6.3f, %6.3f) U (%6.3f, %6.3f)\n", -Inf, f1, f2, Inf)
if(H == 1)
  printf("The null hypothesis is rejected!\n");
  printf("The standard is not met therefore!\n");
else
  printf("The null hypothesis is not rejected!\n");
  printf("The standard is met therefore!\n");
endif

printf("\nThe confidence interval is (%6.3f, %6.3f) : \n", CI)
printf("The value of the test statistic F is %6.3f\n", STATS.fstat)
printf("The P-Value for the variances test is %6.3f\n", P)


#2b) ttest2 instruction : right tailed test for the difference of means
#The variances seem not to be equal

#Adaptable on the statement
#ttest[H, PVAL, CI, STATS] -> STATS is important print only TStat
#Stats.Tstat is the relevant value here;

#Care to Structure Name value
#Example 'Tail' : 'left' OR 'both' OR 'right'

#Test structura : comments to everything, prints, user input.

#-------------------------------------------------------------------------

% PS-practic-ex1
clear
clc
close all

X1 = [4.6, 0.7, 4.2, 1.9, 4.8, 6.1, 4.7, 5.5, 5.4]; % steel
X2 = [2.5, 1.3, 2.0, 1.8, 2.7, 3.2, 3.0, 3.5, 3.4]; % glass

n1 = length(X1);
n2 = length(X2);
m1 = mean(X1);
m2 = mean(X2);
v1 = var(X1);
v2 = var(X2);

% a) At the 5% significance level, do the population variances seem to
% differ?

% H0 = population variances are equal
% H1 = population variances differ
fprintf('a)\n');
fprintf("The null hypothesis H0: population variances are equal\n");
fprintf("The alternative hypothesis H1: population variances differ\n");

% because we must test if the variances differ and we have 2 populations => we
% will use "vartest2"

alpha = input("Please input the significance level: ");

[H, P, CI, STATS] = vartest2(X1, X2, alpha, 0);

f1 = finv(alpha/2, n1-1, n2-1);
f2 = finv(1-alpha/2, n1-1, n2-1);

fprintf("The value of the variances test vartest2 is %.4f\n", STATS.fstat);
fprintf("The rejection region of the variances test is (%.4f, %.4f) U (%.4f, %.4f)\n", -inf, f1, f2, inf);
fprintf("The P-value of the variances test is %.4f\n",P);
fprintf("The value of H of the variances test is %.4f", H);

if H == 0
    fprintf("\nThe null hypothesis is not rejected!\n");
    fprintf("The population variances are equal!\n");
else
    fprintf("\nThe null hypothesis is rejected!\n");
    fprintf("The population variances seem to differ!\n");
end

% b) At the same significance level, does it seem that on average, steel
% pipes lose more heat than glass pipes?

% H0: on average, they lose the same heat (the means are equal)
% H1: on average, steel lose more heat than glass (mean(X1) > mean(X2))
fprintf("b)\n");
fprintf("The null hypothesis H0 is: steel and glass lose the same amount of heat\n");
fprintf("The alternative hypothesis H1 is: steel lose more heat than glass\n");

% because the test is on average => we must test the means
% we have to test the means of 2 populations => ttest2

% if H from point a) is 0 => the variances are equal
% if H from point a) is 1 => the variances differ

if H == 0
    n = n1 + n2 - 2;
    t1 = tinv(1 - alpha, n);
    [H1, P1, CI1, STATS1] = ttest2(X1, X2, alpha, 1, "equal");
    if H1 == 0
        fprintf("\nThe null hypothesis is not rejected!\n");
        fprintf("On average, steel and glass lose the same heat!\n");
    else
        fprintf("\nThe null hypothesis is rejected!\n");
        fprintf("On average, steel lose more heat than glass!\n");
    end
    fprintf("The rejection region for the mean test is (%.4f, %.4f)\n", t1, inf);
    fprintf("The mean test statistic is %.4f\n", STATS1.tstat);
    fprintf("The P-value of the mean test is %.4f\n", P1);
    fprintf("The value of H for the mean test is %.4f", H1);
else
    c = (v1/n1)/(v1/n1+v2/n2);
    n = c^2/(n1-1)+(1-c)^2/(n2-1);
    n = 1/n;
    t1 = tinv(1-alpha, n);
        [H1, P1, CI1, STATS1] = ttest2(X1, X2, alpha, 1, "unequal");
    if H1 == 0
        fprintf("\nThe null hypothesis is not rejected!\n");
        fprintf("On average, steel and glass lose the same heat!\n");
    else
        fprintf("\nThe null hypothesis is rejected!\n");
        fprintf("On average, steel lose more heat than glass!\n");
    end
    fprintf("The rejection region for the mean test is (%.4f, %.4f)\n", t1, inf);
    fprintf("The mean test statistic is %.4f\n", STATS1.tstat);
    fprintf("The P-value of the mean test is %.4f\n", P1);
    fprintf("The value of H for the mean test is %.4f", H1);
end

