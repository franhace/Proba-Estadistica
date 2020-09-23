p_X <- function(x)
    {
    ans <- 0
    if (x==0) ans <- 10/56
    if (x==1) ans <- 30/56
    if (x==2) ans <- 15/56
    if (x==3) ans <- 1/56
    ans
    }

R_X <- 0:3

plot(R_X, sapply(R_X, p_X))

F_X <- function(x){
    acum = 0
    for (i in 0:3)
    {
        if (x>= i & x<i+1) acum <- sum(sapply(0:i, p_X))
    }
    if (x>3)
        acum <-1
    acum
}

print(F_X(3.1))

x <- seq(-3,6, length = 1000)
acumulada <- sapply(x, F_X)
plot(x, acumulada, ylim = c(-0.05,1.05), cex=0.1)
for (x in R_X)
    {
    text(x,F_X(x), "[")
    text(x,F_X(x-0.01), ")")
}

sample(R_X, 1)

R_X

sapply(R_X, p_X)

x <- sample(R_X, 1, prob = sapply(R_X, p_X))
x

set.seed(1234)

n_rep = seq(10,100000, length = 100)

simulacion <- rep(NA, 100)


for (i in 1:100)
{
    simulacion[i] <- mean(replicate(n_rep[i], sample(R_X, 1,prob = sapply(R_X, p_X))))
}


plot(n_rep, simulacion)
abline(h=63/56,col="red")


