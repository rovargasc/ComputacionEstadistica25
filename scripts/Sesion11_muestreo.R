### d
# p
# q


# X distribuye Poisson(5)

## P(X = 3)

dpois(x = 3, lambda = 5)


## Qué significa lo siguiente?

# Sea X v.a distribuye normal(mu = 5, sd = 2)

# Qué significa dnorm()?

dnorm(x = 4, mean = 5, sd = 2)



midensidad = function(x){
  dnorm(x,mean = 170, sd = 12)
}

integrate(midensidad,lower = 150,upper = 168)


regionX=seq(150,168,0.01) # Intervalo a sombrear 
xP <- c(150,regionX,168) # Base de los pol?gonos que crean el efecto "sombra" 
yP <- c(0,dnorm(regionX,170,12),0) # Altura de los pol?gonos sombreados

### grafica de una distribucion normal
curve(dnorm(x,170,12),
      xlim=c(130,210),
      ylim=c(0,0.035),
      yaxs="i",
      ylab="f(x)", 
      main='Densidad N(170,12)') 

#### area coloreada dentro de la gr?fica de una distribuci?n normal
polygon(xP,yP,col="orange1")



########

## Sea X v.a disribuye Poisson(lambda = 10)
# P(X menor o igual a 8)


ppois(q = 8, lambda = 10)

?ppois


### Sea X el peso en gramos de barras de cereal
# X distribuye Normal(mu = 30, sd = 3)

# Qué peso se espera que tengan el 10% menor de las barras?


qnorm(p = 0.1, mean = 30, sd = 3)

# Qué peso se espera que tengan el 10% mayor de las barras?

qnorm(p = 0.1, mean = 30, sd = 3, lower.tail = F)


## Generación de números aleatorios

# Para generar n{umeros} aleatorios en R de una distribución,
# usamps el prefijo r

rpois(n = 1, lambda = 10)

# Para generar un numero aleatorio fijo

set.seed(16)
rpois(n = 1, lambda = 10)


# Generar 10 n{umeros} de Poisson, lambda = 10

pois10 = rpois(n = 10, lambda = 10)
mean(pois10)
var(pois10)


pois100 = rpois(n = 100, lambda = 10)
mean(pois100)
var(pois100)


pois10000 = rpois(n = 10000, lambda = 10)
mean(pois10000)
var(pois10000)

## Generar numeros aleatorios de la distribuci{on exponenciual}

expo100 = rexp(n = 100, rate = 1)

hist(expo100)


promedios = c() # lista vacía para almacenar los promedios

for(i in 1:1000){  # iterador con 1000 repeticiones
  muestraexp = rexp(n = 100) # muestra aleatorio de 100 datos
  media = mean(muestraexp)  # promedio de los valores anteriores
  promedios[i] = media # asigno media a i-ésima posición de vector promedios
}

hist(promedios)


