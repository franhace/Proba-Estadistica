#EJ 1 
# Simular tirada de dados
# a) = {1,2,3,4,5,6}
# d) simulamos tirada de n dados 1 vez
dice.sum <- function(n.dice){
  dice <- sample(1:6, size = n.dice, replace = TRUE)
  return(sum(dice))
}
dice.sum(2)
# e) simulamos tirada 10 (n) veces
dice.rolling<-replicate(1000, dice.sum(2))
dice.rolling

# Hacemos una tabla con la frecuencia
table(dice.rolling)/length(dice.rolling)
# cuantas veces suma es >= 5
mayig5<- sum(dice.rolling >= 5)/(length(dice.rolling))
