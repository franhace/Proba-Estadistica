n <- 20
s = seq(from = 0, to = 5, length.out = 100)
plot(s,s^2*(2/(n+2)), type = 'l', col = 'red', xlab = "s^2", ylab = "ECM")
lines(s,s^2*(2/n), col = 'blue')

sigma2 <- 5

k <- 1:100
plot(k,sigma2^2 *(2/(k+2)), type = 'l',col = 'red', xlab = "n", ylab = "ECM")
lines(k,sigma2^2 *(2/k), col = 'blue')

n <- 20
sigma <- 3

est <- c()
estmv <- c()
for(i in 1:1000){
  x <- rnorm(n, mean = 0, sd = sigma)
  est[i] <- sum(x^2)/(n+2)
  estmv[i] <- mean(x^2)
}
hist(est, breaks = 20, probability = TRUE)
hist(estmv, breaks = 20, probability = TRUE)

mean(est)
mean(estmv)

mean((est-sigma^2)^2)
mean((estmv-sigma^2)^2)


