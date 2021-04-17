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
pbinom(20,25,0.7)
pbinom(24,25,0.7)-pbinom(19,25,0.7)
sum(dbinom(0:20,25,0.7))
sum(dbinom(20:24,25,0.7))
sum(dbinom(20,25,0.7))+sum(dbinom(21,25,0.7))+sum(dbinom(22,25,0.7))+sum(dbinom(23,25,0.7))+sum(dbinom(24,25,0.7))
25*0.7
25*07*0.3

# Ej 11 (HG)  

dhyper(6, 35, 15, 10)
dbinom(6,10,35/50)

# Ej 12 (Ge)
1-pgeom(3, 1/19)
1-sum(dgeom(0:3,1/19))

# Ej 15 (Poisson)
1-ppois(3,2)
1-ppois(4,2)
rango <- c(0,1,2,3,4)
for (i in range(4)) {
  x<-ppois(i,2)
  x
}


# ej 16
1-dbinom(0,1000,0.001)
# si n->inf y p-> 0 Bi = Pois(n*p)
1-ppois(0,1)
1-(1/exp(1))
dpois(3,1)
dbinom(3,1000,0.001)


# ej 17
dpois(0,4)
vec<-0:6
for (i in 0:6){
  lista<-c(0,6)
  pois<-dpois(i,4)
  print(i)
  print(pois)
  lista[i]<-pois
}
table(vec,lista)
length(lista)
lista

# ej 19 (POiss)
ppois(4,2,5)
ppois(6,5)

# ej 20
dpois(0,2)
dbinom(1,4,dpois(0,2))
