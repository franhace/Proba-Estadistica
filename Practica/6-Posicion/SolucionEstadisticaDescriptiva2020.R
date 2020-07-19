
# Leemos los datos

path<-file.choose()

gluco<-read.table(path,header=T)
gluco
View(gluco)

attach(gluco)

dietaa  
dietab
dietac

# o bien si las columnas no tienen nombre

DietaA<-gluco[,1]
DietaA
DietaB<-gluco[,2]
DietaC<-gluco[,3]

# Item a): Medidas resumen: media, mediana, media alpha podada al 10% y 20%

summary(gluco)

apply(gluco, 2, mean)

mean(DietaA)
mean(DietaB)
mean(DietaC)

# Mediana muestral:

apply(gluco, 2, median)

median(DietaA)
median(DietaB)
median(DietaC)

# o bien como length(DietaA) es par podemos hacer:

(sort(DietaA)[50]+sort(DietaA)[51])/2

# O bien a mano porque nos interesa la posici�n 1/2(100+1)=50.5

sort(DietaA)

# Media alpha podada al 10%

mean(gluco,trim=0.1) # anda segn la versi�n de R

mean(DietaA,trim=0.1)
mean(DietaB,trim=0.1)
mean(DietaC,trim=0.1)

# Observemos que coincide con

DietaAordenada<-sort(DietaA)
mean(DietaAordenada[11:90])
 
# si hay muchas columnas mejor hacer los siguiente:

gluco.ord<-apply(gluco, 2, sort)
apply(gluco.ord[11:90,], 2, mean)

# Media alpha podada al 20%

mean(DietaA,trim=0.2)
mean(DietaB,trim=0.2)
mean(DietaC,trim=0.2)

apply(gluco.ord[21:80,], 2, mean)

# Conclusiones: 

# Item b): Medidas de dispersi�n: desv�o est�ndar, distancia intercuartos.

# Varianza muestral

apply(gluco, 2, var)

var(DietaA)
var(DietaB)
var(DietaC)

# Desv�o Muestral: raiz cuadrada de la varianza muestral

sqrt(apply(gluco, 2, var))

c(sqrt(var(DietaA)),sqrt(var(DietaB)),sqrt(var(DietaC)))

# MAD

c(median(abs(DietaA-median(DietaA))),median(abs(DietaB-median(DietaB))),median(abs(DietaC-median(DietaC))))

c(median(abs(DietaA-median(DietaA))),median(abs(DietaB-median(DietaB))),median(abs(DietaC-median(DietaC))))/0.675


##Item c): Percentiles

apply(gluco, 2, quantile) #Da los percentiles 0% (m�nimo), 25%, 50%, 75% y 100% (m�ximo)

#Percentiles 10% y 90%

c(quantile(DietaA,0.10), quantile(DietaB,0.10),quantile(DietaC,0.10))

c(quantile(DietaA,0.90), quantile(DietaB,0.90), quantile(DietaC,0.90))

c(quantile(DietaA,0.05), quantile(DietaB,0.05),quantile(DietaC,0.05))

# a mano el percentil 90% se consigue buscando la posici�n =0.9 * 101=90.9

sort(DietaA)[90]
sort(DietaA)[91]

sort(DietaA)[90]*0.1 + sort(DietaA)[91]*0.9# esto es lo correcto!!!

sort(DietaA)[90]*0.9 + sort(DietaA)[91]*0.1# est� mal!!! pero da lo mismo que el R

quantile(DietaA,0.90) 

# Obervaci�n: Para obtener las distancias intercuartiles podemos hacer:

apply(gluco, 2, quantile)[4,]-apply(gluco, 2, quantile)[2,]

quantile(DietaA,0.75)-quantile(DietaA,0.25)
quantile(DietaB,0.75)-quantile(DietaB,0.25)
quantile(DietaC,0.75)-quantile(DietaC,0.25)

# Rango muestral

apply(gluco, 2, range)

# Conclusi�n: m�s del 80% de los individuos que siguieron la dieta A son saludables, 
# mientras que s�lo el 50% de los individuos que siguieron la dieta B lo son. 
# El 75% de los que siguieron la dieta C tienen niveles de glucosa no saludable.

##Item d): Histograma 

par(mfrow=c(1,3))
hist(DietaA,probability=F)
hist(DietaB)
hist(DietaC)
par(mfrow=c(1,1)) # no elige la misma escala y 

par(mfrow=c(1,3))
hist(DietaA,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaA",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="pink")
hist(DietaB,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaB",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="blue")
hist(DietaC,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaC",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="green")
par(mfrow=c(1,1))


par(mfrow=c(1,3))

hist(DietaA,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaA",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="pink")
equis<-seq(min(DietaA),max(DietaA),by=0.01)
lines(equis,dnorm(equis, mean = mean(DietaA),sd =sqrt(var(DietaA))),col=2,lwd=2)

hist(DietaB,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaB",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="blue")
equis<-seq(min(DietaA),max(DietaA),by=0.01)
lines(equis,dnorm(equis, mean = mean(DietaB),sd =sqrt(var(DietaB))),col=2,lwd=2)

hist(DietaC,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaC",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="green")
equis<-seq(min(DietaA),max(DietaA),by=0.01)
lines(equis,dnorm(equis, mean = mean(DietaC),sd =sqrt(var(DietaC))),col=2,lwd=2)

par(mfrow=c(1,1))

histA<-hist(DietaA,nclass=20,probability=T,main="Histograma de �reas",xlab= "DietaA",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="pink")
histA$counts

# variantes
hist(DietaA,breaks=c(65,75,85,95,105,125),probability=T,main="Histograma de �reas",xlab= "DietaA",ylab="densidad",xlim=c(60,130),ylim=c(0,0.15),border="darkred",col="pink")

# Conclusi�n: La dieta B parece bimodal. En la dieta A parecer�a haber un valor m�s alejado hacia la izquierda.
# La dieta A tiene una distribuci�n bastante sim�trica y unimodal, por lo que un ajuste normal podr�a ser razonable.
# Observemos que la dieta B tambi�n tiene una distribuci�n bastante sim�trica, pero bimodal!
# La dieta C es fuertemente asim�trica hacia la derecha.

# Item e): Box-Plots

par(mfrow=c(1,3))
boxplot(DietaA)
boxplot(DietaB)
boxplot(DietaC)
par(mfrow=c(1,1))

names(boxplot(DietaA))

boxplot(DietaC)$out

boxplot(DietaA,DietaB,DietaC)

par(mfrow=c(1,3))
boxplot(DietaA,ylim=c(65,125),border="brown",xlab="dieta A",col="yellow2",horizontal=F)
boxplot(DietaB,ylim=c(65,125),border="brown",xlab="dieta B",col="yellow2",horizontal=F)
boxplot(DietaC,ylim=c(65,125),border="brown",xlab="dieta C",col="yellow2",horizontal=F)
par(mfrow=c(1,1))
title("Boxplot de las tres dietas")

par(mfrow=c(3,1))
boxplot(DietaA,ylim=c(65,125),border="brown",xlab="dieta A",col="yellow2",horizontal=T)
boxplot(DietaB,ylim=c(65,125),border="brown",xlab="dieta B",col="yellow2",horizontal=T)
boxplot(DietaC,ylim=c(65,125),border="brown",xlab="dieta C",col="yellow2",horizontal=T)
par(mfrow=c(1,1))

# Tambi�n se puede hacer as�: 

boxplot(gluco,ylim=c(65,125),border="brown",col="yellow2")

# Si queremos obtener la informaci�n con la que se construyen los box-plots

boxplotC<-boxplot(DietaC)
boxplotC

boxplotB<-boxplot(DietaB)
boxplotB

# Item f): Q-Q plots

par(mfrow=c(1,3))
qqnorm(DietaA) #Tiene forma de recta
qqnorm(DietaB) #Tiene colas livianas respecto de la distribuci�n normal
qqnorm(DietaC) #Tiene cola liviana a izquierda y cola pesada a derecha respecto de la normal
par(mfrow=c(1,1))

# Conclusi�n: La dieta A tiene una distribuci�n que podr�a aproximarse con una normal.

# Item g)

#La dieta que parece m�s razonable es la Dieta ...



# Podemos ver que, dado que los valores de glucosa saludable est�n entre 
# 80 y 110 mg/dl, la dieta C tiene aproximadamente un 75% de los datos en 
# rangos no saludables.
# La dieta B tiene al 50% de los valores centrales (entre el primer y tercer cuantil)
# en el rango esperado.
# La dieta A parecer�a tener m�s del 50% de los datos en el rango esperado.
