#Ejercicio 1

#Para copiar y pegar datos pueden usar el siguiente codigo que dejo comentado:
#grados<-scan()
#0.6 0.8 -1.1 3.4 5.6 0.8 1.2 1.5 -0.2 3.2 2.7 1.6
#apretar enter en la consola

#Por aca dejo ya el vector armado

grados<-c(0.6,0.8,-1.1,3.4,5.6,0.8,1.2,1.5,-0.2,3.2,2.7,1.6)


n1<-length(grados)
S<-sd(grados)
Tobs1<-sqrt(n1)*mean(grados)/S

pvalor1<-1-pt(Tobs1,11)

kalpha1<-qt(0.05,11,lower.tail = FALSE)


#Ejercicio 2

Sobs=0.22
n2<-91
Tobs2<-(n2-1)*Sobs**2/(0.32**2)
pvalor2<-pchisq(42.53,90)

kalpha2<-qchisq(0.05,90,lower.tail = TRUE)

errorII<-1-pchisq((0.32**2)*kalpha2/(0.24**2),90,lower.tail = TRUE)

#En enviroment pueden ver todas las variables que armamos
#sino pueden poner el nombre de la variable en la consola, dar enter y veran el valor

