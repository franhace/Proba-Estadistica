# 8
# a. b. c. d. e.
pnorm(2)-pnorm(0)
2*(pnorm(2.5)-1/2)
1-(1-pnorm(1.37))
qnorm(0.98)
qnorm(1.9/2)
# f
qnorm(1-0.1)
qnorm(1-0.05)
qnorm(1-0.025)
qnorm(1-0.01)

# 9
mu<-5
sd<-sqrt(0.25)
(5.5-mu)/sd
# a
pnorm((5.5-mu)/sd)-(1-pnorm((4.75-mu)/sd*-1))
# b
1-pnorm((5.25-5)/0.5)+pnorm((-5.25-5)/0.5)
# c
qnorm(1.9/2)/2
# d
(qnorm(0.9)/2)+5

# 10 
qnorm(0.58)
qnorm(0.38)
qnorm(0.04)
qnorm(0.38+0.58)
# 11
qnorm(0.75)-qnorm(0.25)
log2(0.01)/log2(4/5)
log2(0.01)

# 13
pnorm(0.1/0.3)-pnorm(0.5)
1-(pnorm(0.5)*0.35-(1-pnorm(0.1/0.3))*0.65)

nf<-51
entrega1<-7.5
entrega2<-5
entregas<-entrega1+entrega2+ 6*5 # max 70
tot = nf+ entregas*(10/7)/2
tot
tot  > 80
