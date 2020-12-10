a<-1-pnorm(0.5)
b<-1-punif(29,25,30)
a*0.4+b*0.6
0.4*27+0.6*(55/2)


c<-1-punif(7,0,10)
d<-1-pexp(7,1/6)
c*0.3+d*0.7
0.3*5+0.7*6

# ej 3

##HYPERGEOMETRICA:  H(n, N, D) --> Hay N opciones, D favorables y extraigo n elementos
dhyper(k, B, N-B, n)  #P(x = k)
dhyper(2, 14, 11, 2) # == dbinom(k,n,D/N)
#E(x) = n*D/N
dhyper(2, 8, 8, 6)
1-dhyper(0, 8, 8, 6)

# ej 4
1-exp(-1)
exp(-1)

# ej 6
1-pbinom(1,11,0.3)
1-sum(dbinom(0:1,11,0.3))

x<-1-pbinom(1,11,0.3)
y<-1-pbinom(0,11,0.7)
(x*0.3+y*0.7)/y*0.7
´