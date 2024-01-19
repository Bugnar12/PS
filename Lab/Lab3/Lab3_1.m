%X-the number of successes ; N-the number of tries; PS-probability of obtaining successes
%c)
%P(X=0)
p1=binopdf(0, 3, 0.5)
p2 = 1 - binopdf(1, 3, 0.5) %the opposite of not 1 ; opposite = 1 - condition

#d)
p3 = binocdf(2, 3, 0.5)
p4 = binocdf(1, 3, 0.5)

#e)
%P(X>=1) = 1 - P(X<1) = 1 - P(X<=0)
p5 = 1 - binocdf(0, 3, 0.5)
%P(X>1) = 1 - P(X<=1)
p6 = 1 - binocdf(1, 3, 0.5)


