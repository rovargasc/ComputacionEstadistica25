### Sesión 4 - 10 de abril de 2025 ###########

## Medidas estadísticas en R ######

## Promedio ##

# El promedio es una medida de tendencia central.

x = c( 2, 4, 60)

# para realizar un promedio en R se usa la fórmula de mean

mean(x)

## Puedo tener lo que se conoce como media recortada

x2 = 1:100

mean(x2)


mean(x2, trim = 0.3)


x <- c(0:10, 50)
mean(x, trim = 0.1)

# standby...

### media ponderada ####

# tengo 1 asignatura (computaci{on})
# Taller 1: 30 %
# taller 2: 30%
# tareas: 15%
# expo: 25#

# Taller 1: 4.8
# Taller2 : 4.5
# Tareas: 4.3
# expo: 3.2

calificaciones = c(3, 4.5, 4.3, 3.2)
pesos = c(0.3, 0.3, 0.15, 0.25)

mean(calificaciones)

weighted.mean(calificaciones, w = pesos)


### Mediana ###

## Es el valor que separa el 50% de los valores más altos
# del 50% de los valores más bajos

x = c(4, 6, 2)

median(x)


## cuantiles ####

## Para encontrar cuantiles, usamos la función quantile()

data(mtcars)


quantile(mtcars$mpg, probs = 0.8)

quantile(mtcars$mpg, probs = 0.2)

quantile(mtcars$mpg, probs = c(0.2, 0.8))

## Desviación estándar ####

# Motivación

### sd()

x

sd(x)

sd(mtcars$mpg)

## Las millas por galón se desvían del promedio en 6 mpg,
# en promedio

## Media = 20
## desv = 6

#### Medida estandarización #######

z = (mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg)
z
z[16]
mtcars$mpg[16]

mean(mtcars$mpg) - 1.6*sd(mtcars$mpg)

### Coeficiente de variación

xbar = mean(mtcars$mpg)
xdesv = sd(mtcars$mpg)

cv = xdesv/xbar*100
cv

### Coeficiente de correlación

# se necesitan dos variables. Funcion cor(x,y)

# Obtengamos la correlación entre las millas por galon
# que consume un auto y su peso

cor(mtcars$mpg, mtcars$wt)

plot(mtcars$mpg, mtcars$wt)

cor(mtcars$mpg, mtcars$wt, method = "spearman")

##### ejemplo...

data(swiss)

?swiss

### Calculemos el promedio de católicos
# por provincia

## Queremos 3 niveles de porcentaje de 
# católicos

# podemos usar la función cut
# para discretizar una variable

catolicos = cut(swiss$Catholic, breaks = c(0, 33,66,100),
                labels = c("Bajo", "Medio", "Alto"))

# hagan table(catolicos)
catolicos

table(catolicos)

### Librería dplyr #####

# Motivación
## Promedio de mpg por numero de cilindros

table(mtcars$cyl)

# Manera fea...
mpg4 = mtcars$mpg[mtcars$cyl == 4]
mpg6 = mtcars$mpg[mtcars$cyl == 6]
mpg8 = mtcars$mpg[mtcars$cyl == 8]

mean(mpg4)
mean(mpg6)
mean(mpg8)

### función select()

# select, como su nombre lo indica, va a permitir
# seleccionar columnas

colnames(mtcars)

mtcars[, c(1,6)]
library(dplyr)

mtcars %>% select(mpg, wt)
