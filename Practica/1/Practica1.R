# Title     : TODO
# Objective : TODO
# Created by: nn
# Created on: 27/4/20

#Ejercicio 1
#d) simular tiro dado
dice.roll<-sample(1:6, size = 1, replace = TRUE)
dice.roll2<-sample(1:6, size = 2, replace = TRUE)
sum(dice.roll2)

# Hacemos una funcion con nos deja ingresar la cantidad de dados
# Y nos devulve la suma
dice.sum <- function(n.dice){
  dice <- sample(1:6, size = n.dice, replace = TRUE)
  return(sum(dice))
}
# Replicamos 1000 veces el experimento
dice.rolling<-replicate(10000, dice.sum(2))

# Hacemos una tabla con la frecuencia
table(dice.rolling)/length(dice.rolling)

plot(table(dice.rolling), xlab = 'Sum', ylab = 'Frequency', main = '100 Rolls of 2 Fair Dice')

# Proba de que suma
# dice5.sum <- function(n.dice){
#   dice5 <- sample(1:6, size = n.dice, replace = TRUE)
#   if (sum(dice5) >= 5)
#     return(dice5)
#
# }

sum(dice.rolling >= 5)/(length(dice.rolling))