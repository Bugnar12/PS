m = input("Please input m = ") %DF1 = degree of freedom
n = input("Please input n = ") %DF2 = degree of freedom
alpha = input("Please input alpha = ") % 0<alpha<1
beta = input("Please input beta = ") %0<beta<1

%1.a)

%P(X<=0)
f1 = fcdf(0, m, n)
%P(X >= 0) = 1 - P(X<0) = 1 - P(X<=0)
f2 = 1 - fcdf(0, m, n)

%b)
%P(-1 <= X <= 1)
%P(a <= X <= b) = F(b) - F(a)
f3 = fcdf(1, m, n) - fcdf(-1, m, n)
f4 = 1 - (fcdf(1, m, n) - fcdf(-1, m, n))

%c)
%~the inverse of a function
%quantile ~ "inverse" of the CDF
%inv helps find the quantile

x_alpha = finv(alpha, m, n);
%d) ~same idea just 1-beta because it's > not <
x_beta = finv(1-beta, m, n);

%prefixes : norm , t(student) and USE help pdf to get the others (chi-squared)

%Compute the normal distribution ; rest are computed in the same manner but change prefixes
n1 = normcdf(0, m, n)
n2 = 1 - normcdf(0, m, n)
