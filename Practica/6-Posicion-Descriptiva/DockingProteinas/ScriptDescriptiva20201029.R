#Cargamos los datos

score <- read.table("scoring.txt", header = TRUE)
score

#Ejercicio 1

#Calculamos las medias

media_1 <- mean(score[,1]) 
media_1
#Podemos elegir también según los nombres de las columnas

media_1 <- mean(score$func1)
media_1
media_2 <- mean(score$func2)
media_2
media_3 <- mean(score$func3)
media_3

#Podemos usar colMeans o aplicar una función por columnas

colMeans(score)

mediafunc <- apply(score, 2, FUN = "mean")
mediafunc
medianafunc <- apply(score, 2, FUN = "median")
medianafunc

#Calculamos la media alfa-podada con mean y el valor alfa como argumento

media_01 <- rep(0,3)
media_1_01 <- mean(score$func1, 0.1)
media_1_01
media_01[1] <- media_1_01
media_2_01 <- mean(score$func2, 0.1)
media_2_01
media_01[2] <- media_2_01
media_3_01 <- mean(score$func3, 0.1)
media_3_01
media_01[3] <- media_3_01

#Armamos un data frame con estos valores para visualizarlos 

centralidadfunc <- data.frame( 
  Media = c("Media", mediafunc),
  Mediana = c("Mediana", medianafunc),
  Podada01 = c("Media01", media_01))
centralidadfunc

#Ejercicio 2

#Calculamos los percentiles pedidos con la función quantile,
#usando como argumento un vector que indique qué cuantil queremos.

quantile(score$func1, c(0.1,0.25,0.5,0.75,0.9))
quantile(score$func2, c(0.1,0.25,0.5,0.75,0.9))
quantile(score$func3, c(0.1,0.25,0.5,0.75,0.9))

#Para algunos casos podemos usar summary

summary(score$func1)
summary(score$func2)
summary(score$func3)

#Ejercicio 3

#Calculamos el desvío muestral, el IQR, la MAD con los comandos:

sd(score$func1)
IQR(score$func2)
quantile(score$func1,0.75)-quantile(score$func1,0.25)

#Calculamos todo junto y armamos un data frame para visualizarlos

apply(score, 2, "sd")
apply(score, 2, "IQR")
apply(score, 2, "mad")

dispersionfunc <- data.frame( 
  SD = c("SD", round(apply(score, 2, "sd"),3)),
  IQR = c("IQR", round(apply(score, 2, "IQR"),3)),
  MAD = c("MAD", round(apply(score, 2, "mad"),3)))

dispersionfunc

#Ejercicio 4

#Para representar un histograma usamos el comando hist.
#R determina automáticamente el tamaño de los intervalos.


#A estos histogramas les superpondremos curvas normales.
#Calculamos medias y desvíos para representar las curvas normales.
media_1<-mean(score$func1);desvio_1<-sd(score$func1)
media_2<-mean(score$func2);desvio_2<-sd(score$func2)
media_3<-mean(score$func3);desvio_3<-sd(score$func3)

#El argumento prob indica si queremos que se normalice el histograma
#(la suma de las áreas es 1) o no (frecuencias relativas).
#También puede aparecer como argumento freq, que sería su opuesto.
#Normalizamos para comparar con una curva de densidad.

hist(score$func1, prob=TRUE)
curve(dnorm(x, mean = media_1, sd= desvio_1), add=TRUE)

hist(score$func2, prob=TRUE)
curve(dnorm(x, mean = media_2, sd= desvio_2), add=TRUE)

hist(score$func3, prob=TRUE)
curve(dnorm(x, mean = media_3, sd= desvio_3), add=TRUE)

#Ejercicio 5

#Armamos los boxplots.

#Se puede hacer de dos formas:
#with(data=score, boxplot(func1, func2, func3))
#O así, y le ponemos los nombres
boxplot(score$func1, score$func2, score$func3, 
        names=c("Función 1","Función 2", "Función 3"))

#Ejercicio 6

#Armamos los qqplots.
#El comando qqline grafica la línea y=x de referencia.

with(data=score, qqnorm(func1))
qqline(score$func1, col = "steelblue", lwd = 2)
with(data=score, qqnorm(func2))
qqline(score$func1, col = "red", lwd = 2)
with(data=score, qqnorm(func3))
qqline(score$func1, col = "gold", lwd = 2)

