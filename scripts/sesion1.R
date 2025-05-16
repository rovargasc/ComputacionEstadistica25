# Clase 1 R Estadístico.

# Introducción


# Construcción de objetos.


#   <-    =     ->


a = 3

b = 5


f  # sale error porque no está creado


a

a + b


class(a)



## Cadenas de texto (character)
# Siempre van a ir entre comillas


nombre1 = "Miguel" 



### Valores logicos


# Son aquellos que solo pueden tomar TRUE o FALSE

verd = TRUE

class(verd)


fake = FALSE

a>b # es a mayor que b?



7 < 10


a == 5   # es a igual a 5?



### 50 millones 3 personas.



TRUE + TRUE

T + F



### Vectores
# Son arreglos de elementos

# Se crean con la letra c.


notas = c(4.9,5.2,3.5,2.8,3.7)

# Para coger elementos específicos, se hace con []

notas[3]

length(notas) # 5 notas.

# Motivación:

notas > 4

sum(notas > 4)


notas

notas[notas > 4]


notas2 = c(3.7,4.9,5,"2")


notas3 = c(2,3,"cuatro")


### Matriz
# Se crean con la función matrix

1:12

datos1 = 1:12

matriz1 = matrix(datos1, nrow = 2)

matriz2 = matrix(datos1, nrow = 2, byrow = T)


matriz3 = matrix(data = datos1, nrow = 4)
matriz3



## Cómo obtener posiciones de matrices

# matriz[fila,columna]

# Obtengamos el elemento de la fila 2, columna 1

matriz3[2,1]


# Si quiero todos los elementos de la columna 1:

matriz3[,1]

matriz3[1,]


### Dataframes


data(mtcars)

?mtcars

mtcars[,1]


mtcars[mtcars$mpg>= 25,]

mtcars[mtcars$mpg >= 25 & mtcars$hp > 90,]



## quiero coger las primeras dos columnas

mtcars[,1:2]

#   quiero las columnas 2 y 5

mtcars[,c(2,5)]

# Todas las columnas excepto la 7ma

mtcars[,-7]

mtcars[,-c(4,6:11)]




