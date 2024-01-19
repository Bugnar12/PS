
%b)
%Poisson aprox.
%1.Get n and get p from the user such that constraints are satisfied
%2.Prepare lambda = n * p
%3.Draw in the same graph a binopdf and the poissonpdf
%(code) : z = poisspdf(k, lambda)

n1 = input("Please input the number of trials greater than 29: ");
p1 = input("Please input the probability of success <= 0.05: ");

lambda = n1 * p1;
for n1 = 1:3:100
    k = 0:n1;
    z = poisspdf(k, lambda);
    plot(k, z)
    pause(0.3)
endfor


