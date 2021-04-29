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
dbinom(2,3,1/5)*100
log2(0.01)/log2(4/5)

# 13
# a
a<-(1-(pnorm(1/2)))*0.35+(pnorm(1/3))*0.65
# b
(1-(pnorm(1/2)))*0.35/a


# 14

# 16 - Exponencial 
# a
lambda<-log(0.449)/(-20)
esp<-1/lambda
var<-1/lambda**2
# b
exp(lambda*(-10))

# 18 - Exponencial
p<-exp(-2)
dbinom(2,3,p)

# 24 - Generacion numeros al azar
# Para numero continuos -> distrib continuas
# Unif
runif(1) # 1 num aleatorio entre 0,1
runif(2,0,37) # 2 nums aleatorios entre 0..37
x=runif(100) # 100 nums aleatorios
hist(x,probability=TRUE,col=gray(.9),main="uniform on [0,1]")    
curve(dunif(x,0,1),add=T)

# Normal
x=rnorm(100)
hist(x,probability=TRUE,col=gray(.9),main="normal mu=0,sigma=1")
curve(dnorm(x),add=T)

# Para numeros discretos
# binomial
n = 10; p=.5
rbinom(1,n,p)
rbinom(5,n,p)

# exp
x=rexp(100,1/2500)
hist(x,probability=TRUE,col=gray(.9),main="exponential mean=2500")
curve(dexp(x,1/2500),add=T)

# integrales
# Integrar
integrar <- function(fx, lower, upper) {
  return(integrate(fx, lower, upper)$value)
}

# Ex generica
ex_generica <- function(fx, lower, upper) {
  return(integrar(function(x) {x*fx(x)}, lower, upper))
}

# Vx generica
vx_generica <- function(fx, ex, lower, upper) {
  return(integrar(function(x) {fx(x)*((x-ex)^2)}, lower, upper))
}

# 4.b) Calcular E(Y) y V(Y)
# Fy(u) = 0.5 = (2u/5 - u^2/50) - 1 => u = 5
# V(Y) = E(X^2) - E(X)^2 = E((X - E(X))^2) = integrate(f(x) * (x-ux)^2 dx, -Inf, Inf)

fy <- function(y) {ifelse(y >= 0 & y <= 5, y/25, 0)}
fy_2 <- function(y) {ifelse(y >= 5 & y < 10, (2/5) - (y/25), 0)}

ex1 <- ex_generica(fy, 0, 5)
ex2 <- ex_generica(fy_2, 5, 10)
ex <- ex1 + ex2
ex

vx <- vx_generica(fy, ex, 0, 5) + vx_generica(fy_2, ex, 5, 10)
vx

lambda1<-13
lambda2<-10
# a)
lambda2/(lambda1+lambda2)
# b) 
# P(X > 12) = 1 - F(X<=12) 
(-exp(-lambda1*12))*(-exp(-lambda2*12))

euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
x1<-c(7,0)
x2<-c(3,4)
xm<-c(5,2)
a<-euc.dist(x1,x2)
b<-euc.dist(x1,xm)
c<-euc.dist(xm,x2)
b+c
a

# parcialitos
a<-1-pnorm(1/5)
b<-pnorm(1.7)-a
c<-1-(a+b)
xa<-pbinom(9,24,a)
xb<-pbinom(12,24,b)
xc<-pbinom(3,24,c)
xa*xb*xc
x<-c(9,12,3) # cant que queremos de cada
p<-c(a,b,c) # proba de cada evento
dmultinom(x,24,p) # Multinomial

## NOTAS
nf<-51
entrega1<-7.5
entrega2<-5
entregas<-entrega1+entrega2+ 6*5 # max 70
tot = nf+ entregas*(10/7)/2
tot
tot  > 80
