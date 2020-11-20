# Ejercicio 9 de la guía 8
# b) Con los datos de la guía:
n <- 1000
exitos <- 600
xraya <- exitos/n
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC

# Con los datos del shiny: empecemos con un n chico...
datos <- read.csv("datos_Practica8_ej6libreta1989n_50.csv")
factor(datos$encuesta)

n <- length(datos$encuesta)

# En contra = 1; a favor o indeciso = 0
unos <- length(which(datos$encuesta == "en contra"))
ceros <- n-unos

# Datos "limpios"
x <- c(rep(1,unos),rep(0,ceros))

# IC
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC

# Aumentamos el n: 1000
datos <- read.csv("datos_Practica8_ej6libreta1989n_1000.csv")
factor(datos$encuesta)

n <- length(datos$encuesta)

# En contra = 1; a favor o indeciso = 0
unos <- length(which(datos$encuesta == "en contra"))
ceros <- n-unos

# Datos "limpios"
x <- c(rep(1,unos),rep(0,ceros))

# IC
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC

# El shiny no llega a un n tan grande como el necesario para 
# que la longitud del IC sea menor a 0.02.
# Mentimos un poquito y hacemos un sample con repo de los datos
x <- sample(x, 6764, replace = TRUE)
n <- length(x)

xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC


# El shiny sí llega... probamos
datos <- read.csv("datos_Practica8_ej6libreta1989n_6764.csv")
factor(datos$encuesta)

n <- length(datos$encuesta)

# En contra = 1; a favor o indeciso = 0
unos <- length(which(datos$encuesta == "en contra"))
ceros <- n-unos

# Datos "limpios"
x <- c(rep(1,unos),rep(0,ceros))

# IC
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC

# PREGUNTAS PARA PENSAR...
# Si tomo una muestra de tamaño 6763 (o menor, incluso),
# ¿tengo CERTEZA de que la longitud del IC va a ser superior a 0.02?
# ¿Hay/hubo algo aleatorio en la longitud de este intervalo?
# ¿El n que hallamos en el ejercicio es el mínimo que satisface lo pedido?
# Con n=6764, ¿podría haberme dado mayor a 0.02?



# EXTRA: ¿Y si hubiéramos conocido la distribución?
# IC
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(var(x)/n)
sup <- xraya+z*sqrt(var(x)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC #¡APENAS MAYOR!

# Veamos cómo hubiera incidido en el caso de n chico (50)
datos <- read.csv("datos_Practica8_ej6libreta1989n_50.csv")
factor(datos$encuesta)

n <- length(datos$encuesta)

# En contra = 1; a favor o indeciso = 0
unos <- length(which(datos$encuesta == "en contra"))
ceros <- n-unos

# Datos "limpios"
x <- c(rep(1,unos),rep(0,ceros))

# IC usando que la distribución es Bernoulli
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(xraya*(1-xraya)/n)
sup <- xraya+z*sqrt(xraya*(1-xraya)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC #0.2318719

# IC sin usar que la distribución es Bernoulli
xraya <- mean(x)
alpha <- 0.1

z <- qnorm(1-alpha/2,0,1)

inf <- xraya-z*sqrt(var(x)/n)
sup <- xraya+z*sqrt(var(x)/n)
IC <- c(inf, sup)
IC

longIC <- sup-inf
longIC #0.2342259, apenas mayor :)
