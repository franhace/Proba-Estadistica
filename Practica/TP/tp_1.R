#1) 

#a)
n <- 1000
E_unif_0_1 <- 0.5
V_unif_0_1 <- 1/12

set.seed(1)
sample_mean_1 <- runif(n,0,1)
hist(sample_mean_1,probability = TRUE)

#b)
sample_mean_2 <- replicate(n,mean(runif(2,0,1)))
hist(sample_mean_2,probability = TRUE)

#c)
sample_mean_5 <- replicate(n,mean(runif(5,0,1)))
hist(sample_mean_5,probability = TRUE)

#d)
sample_mean_30 <- replicate(n,mean(runif(30,0,1)))
hist(sample_mean_30,probability = TRUE)

#e)
sample_mean_500 <- replicate(n,mean(runif(500,0,1)))
hist(sample_mean_500,probability = TRUE)

#f)
sample_mean_1200 <- replicate(n,mean(runif(1200,0,1)))
hist(sample_mean_1200,probability = TRUE)


boxplot(sample_mean_1,sample_mean_2,sample_mean_5,sample_mean_30,
        sample_mean_500,sample_mean_1200,
        main = "Promedio de n unif",
        at = c(1,2,3,4,5,6),
        names = c("n = 1",
                  "n = 2",
                  "n = 5",
                  "n = 30",
                  "n = 500",
                  "n = 1200"))


normalize <- function(x) {
  (x - E_unif_0_1) / sqrt(  (1/12)/n )
}



#a normalizado
sample_mean_normalize_1<- sapply(sample_mean_1,FUN=normalize)
hist(sample_mean_normalize_1,probability = TRUE)
boxplot(sample_mean_normalize_1)
#b normalizado
sample_mean_normalize_2<- sapply(sample_mean_2,FUN=normalize)
hist(sample_mean_normalize_2,probability = TRUE)
boxplot(sample_mean_normalize_2)
#c normalizado
sample_mean_normalize_5<- sapply(sample_mean_5,FUN=normalize)
hist(sample_mean_normalize_5,probability = TRUE)
boxplot(sample_mean_normalize_5)
#d normalizado
sample_mean_normalize_30<- sapply(sample_mean_30,FUN=normalize)
hist(sample_mean_normalize_30,probability = TRUE)
boxplot(sample_mean_normalize_30)
#e normalizado
sample_mean_normalize_500<- sapply(sample_mean_500,FUN=normalize)
hist(sample_mean_normalize_500,probability = TRUE)
boxplot(sample_mean_normalize_500)
#f normalizado
sample_mean_normalize_1200<- sapply(sample_mean_1200,FUN=normalize)
hist(sample_mean_normalize_1200,probability = TRUE)
boxplot(sample_mean_normalize_1200)


boxplot(sample_mean_normalize_1,
        sample_mean_normalize_2,
        sample_mean_normalize_5,
        sample_mean_normalize_30,
        sample_mean_normalize_500,
        sample_mean_normalize_1200,
        main = "Promedio de n unif normalizados",
        at = c(1,2,3,4,5,6),
        names = c("n = 1",
                  "n = 2",
                  "n = 5",
                  "n = 30",
                  "n = 500",
                  "n = 1200"))
uniform_1 <- hist(sample_mean_normalize_1,probability = TRUE)
uniform_2 <- hist(sample_mean_normalize_2,probability = TRUE)
uniform_5 <- hist(sample_mean_normalize_5,probability = TRUE)
uniform_30 <- hist(sample_mean_normalize_30,probability = TRUE)
uniform_500 <- hist(sample_mean_normalize_500,probability = TRUE)
uniform_1200 <- hist(sample_mean_normalize_1200,probability = TRUE)

normal <-hist(rnorm(n,0,1),probability=TRUE)

plot( normal, col=rgb(0.1,0.1,0.1,0.5))  
plot( uniform_1,add=TRUE, col=rgb(0.8,0.8,0.8,0.5),.5) 
box()

plot( normal, col=rgb(0.1,0.1,0.1,0.5))  
plot( uniform_500,add=TRUE, col=rgb(0.8,0.8,0.8,0.5),.5) 
box()

plot( normal, col=rgb(0.1,0.1,0.1,0.5))  
plot( uniform_1200,add=TRUE, col=rgb(0.8,0.8,0.8,0.5),.5) 
box()



