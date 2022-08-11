# EJ 1 
# Proba puntual y FDA

x <- c(0,1,2,3)
pX <- rep(0,4)


pX[1] <- 11*11*11/(15*15*15)
pX[2] <- 3*4*11*11/(15*15*15)
pX[3] <- 3*4*4*11/(15*15*15)
pX[4] <- 4*4*4/(15*15*15)

FX <- c(pX[1], pX[1]+pX[2], pX[1]+pX[2]+pX[3], pX[1]+pX[2]+pX[3]+pX[4])
FX

plot(x,pX, ylim=c(0,1))
points(x, FX, ylim=c(0,1), col=2)

#########################

# Ej 2
Xprima <- c(rep(1,3), rep(3,1), rep(6,2), rep(12, 4))
sample(Xprima, 5, replace = TRUE)

muestra <- sample(Xprima, 10000, replace = TRUE)
length(muestra[muestra == 1])/10000
vectorproba <- c(0.3,0.1,0.2,0.4)
rango <- c(1,3,6,12)
muestra <- sample(rango, 5, replace=TRUE, prob=vectorproba)

muestra10000 <- sample(rango, 10000, replace=TRUE, prob=vectorproba)
k <- 1
proba <- rep(0,4)
for (r in rango){
  proba[k] <- length(muestra10000[muestra10000==r])/10000
  k <- k+1
}
proba

#################### 

# Ej 3
# a) graficar fpp
x <- c(0,1,2,3,4)
pX <- rep(0,5)
x
pX
pX[1] <- (10*9*8*7)/(15*14*13*12)
pX[2] <- choose(5,1)*(4*11*10*9*8)/(15*14*13*12*11)
pX[3] <- choose(5,2)*(4*3*11*10*9)/(15*14*13*12*11)
pX[4] <- choose(5,3)*(4*3*2*11*10)/(15*14*13*12*11)
pX[5] <- choose(5,4)*(4*3*2*11)/(15*14*13*12*11)
library(MASS)
f = function(x, den) {paste0(round(x * den), "/", den)}
f(pX, 91)
pX
plot(x,pX)

# b) P(x>=W) = 1 - F(x<W) = 1 - F(x<W-)
# W = 2 -> 1-F(2-) -> 1-F(1)
1-(pX[1]+pX[2])

# c)
library(MASS)
fractions(pX)
fractions((2/13)+40/91)

###################

# Ej 6
# a)
p1<-(2*3*2)/(6*5*4)
p2<-(4*4*3)/(6*5*4)
p3<-fractions(2*(2*2*3)/(6*5*4))
p3
p4<-(4*2)/(6*5)
fractions(p4)
p4
p5<-(2*2)/(6*5*4)
pV <- c(p1+p2,p3+p4,p5)
fractions(pV)
# b)
xs<-c(0,1,2)
eX<-(sum(pV*(xs)))
eX2<-(sum(pV*(xs**2)))
vX<-(eX2-(eX**2))
fractions(vX)
###################

# EJ 7 - Bit de paridad
#a)

1-dbinom(0,7,0.01)
1-dbinom(0,8,0.01)

# c)
nums<-seq(2,8,by=2)
n<-8
p<-0.01
sum(dbinom(nums,n,p))
a<-plot(nums, log(dbinom(nums, n, p)))

####################

# Ej 9 ( Binomial )
n<-25
p<-0.7
# a)
#  i) 
dbinom(20,n, p)
#  ii)
pbinom(24,n, p)-pbinom(19,n, p)
sum(dbinom(20:24,n, p))
# b)
(eXB<-n*p)
eXB
(vXb<-(n*p*(1-p)))

###############

# Ej 10
p<-0.2
# a)
dbinom(0,15,p)
# b)
sum(dbinom(0:3, 15, p))
pbinom(3,15,p)
# c)
1-pbinom(6,15,p)

###############

# Ej 12 (HG)  
# HG(N,B,m)
# a)
N<-50 # N: num total
k<-6 # x cuantas de las buenas tomamos
B<-35 # m total de buenas
n<-N-B # n total de malas
m<-10 # cuantas sacamos del total
hg<-dhyper(k,B,n,m)
dhyper(6, 35, 15, 10)

# b)
# Si N->inf podemos aprox con Binomial de parametros
# Bi(m,B/N)
B<-B*10
N<-N*10
bin<-dbinom(6,m,B/N)
# error en aprox
error<-(hg-bin)/(hg*100)
hg-bin

# c)
eXHG<-m*B/N
eXB<-m*B/N

vXHG<-m*(B/N)*((N-B)/n)*((N-m)/(N-1))
vXB<-(m*B/N)*(1-B/N)


###############

# Ej 13 (Ge)
# a) 
p<-2/38
1-pgeom(3,p)
1-sum(dgeom(0:3, p))
1-pnbinom(3,1,p) # es igual a BN(r,p) donde r = 1
# c)
# idem
eXG<-1/p
vXG<-(1-p)/p**2

###############

# Ej 14 dnbinom(k,r,p)
dnbinom(5,3,p)

###############

# Ej 15
# a)
(1/2)*(1-pgeom(5,0.1)+1-(pgeom(5,0.05)))
(1/2)*(1-sum(dgeom(0:5,0.1))+1-sum(dgeom(0:5,0.05)))
(1/2)*((0.9)**5+(0.95)**5)
# c)
(dnbinom(10,2,0.1)+dnbinom(10,2,0.05))*(1/2)

###############

# Ej 16 (Poisson)
# a)
1-ppois(3,2)
# b)
1-ppois(4,2)
# c)
rango <- c(0,1,2,3,4)
dpois(rango, 2)
# d)
# jugamos con el k y vemos cuando se supera el umbral
# en este caso 0.99
rangok<-0:10
ppois(rangok,2)
# forma alternativa 
for (i in (rangok)) {
  if (ppois(i,2) > 0.99){
    print("Eureka!")
    print(i)
    break
  } 
}

###############

# ej 16
1-dbinom(0,1000,0.001)
# si n->inf y p-> 0 Bi = Pois(n*p)
1-ppois(0,1)
1-(1/exp(1))
dpois(3,1)
dbinom(3,1000,0.001)


###############

# Ej 17 - Aprox de la Binomial por Poisson
# n-> inf y p-> 0 Bi(n,p) == P(n*p)
n<-1000
p<-0.001
# a) 
1-dbinom(0,n,p)
1-dpois(0,n*p)
# b)
dbinom(3,n,p)
dpois(3,n*p)

###############

# Ej 18 - Pois
# a)
lista<-c(0:6)
lista
dpois(lista,4)
# b)
eY<-lista*dpois(lista,4)
sum(eY)-100

###############

# ej 19 - Pois con Theta
# a)
ppois(4,5/2) # sum(dpois(0:4,2.5))
# b)
ppois(6,5)
dpois(6,5) # ppois(6,5)-ppois(5,5)
1-ppois(4,5)
ppois(6,5)-ppois(2,5)
ppois(5,5)-ppois(3,5)
(ppois(6,5)-ppois(3,5))/(1-ppois(3,5))
# c)

###############

# ej 20
# a)
dpois(0,4)
# b)
dbinom(1,4,dpois(0,2))

###############