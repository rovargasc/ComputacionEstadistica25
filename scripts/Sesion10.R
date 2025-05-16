#### Plotly #####



library(plotly)

library(gapminder)
data(gapminder)

# Mi primer gráfico con plotly

colnames(gapminder)


plot_ly(data = gapminder, x =~lifeExp)


## Boxplot

plot_ly(data = gapminder,x =~ lifeExp, type = "box")

plot_ly(data = gapminder,x =~ lifeExp, 
        type = "box", color=~continent)


### Gráfico de puntos

plot_ly(data = gapminder, x =~log(gdpPercap),
        y =~lifeExp, color =~continent,
        text=~country, size = ~pop)


plot_ly(data = gapminder, x =~log(gdpPercap),
        y =~lifeExp, color =~continent,
        text=~country, size = ~pop, frame =~year)


###### Distribuciones de probabilidad en R #########

## para encintrar la función másica de probabilidad
# usamos el prefijo d, junto con el nombre de la variable
# discreta (o una abreviación, según la implementación en R)

# Para binomial:
# x: # de éxitos que deseo
# size: Número de experimentos
# prob = probabilidad de éxito

# Se tiene el lanzamiento de 3 monedas
# Cuál es la probabilidad de que al lanzarlas 2 caigan cara?

dbinom(x = 2, size = 3, prob = 0.5)

# Cuál es la probabilidad de que salgan 1 o 2 caras?

dbinom(x = 2, size = 3, prob = 0.5) +
  dbinom(x = 1, size = 3, prob = 0.5)

# Cuál es la probabilidad de que salgan menos de 3 caras?
dbinom(x = 2, size = 3, prob = 0.5) +
  dbinom(x = 1, size = 3, prob = 0.5) +
  dbinom(x = 0, size = 3, prob = 0.5)


# Otra forma:
1 - dbinom(x = 3, size = 3, prob = 0.5)


### Cálculo de probabilidades acumuladas

# Para obtener probabilidades acumuladas, se usa el prefijo p
# seguido del nombre de la disstribución en R

# Con el ejemplo anterior:
# q: punto hasta donde quiero encontrar la probabilidad acumulada
# size: Número de experimentos
# prob: Probabilidad de éxito

# Como en el ejemplo anterior
pbinom(q = 2, size = 3, prob = 0.5)


## Segunda idstribución discreta: Poisson

# Sea X el número de personas que llegan a una pizzería
# En promedio, llegan 20 personas por día...

# Cuál es la probabilidad de que en un día en específico
# lleguen 15 personas?

dpois(x = 15, lambda = 20)

eventos = 5:25

probabilidades = dpois(eventos, lambda = 20)

probabilidades

sum(probabilidades)

plot(eventos, probabilidades, type = "h")

# Si llegan menos de 10 personas, es posible
# que la pizzería no llegue al punto de equilibrio
# y termine quebrando
# Cuál es la probabilidad de que eso ocurra?

ppois(q = 9, lambda = 20)


#dgeom()
#dhy


### Distribuciones de probabilidad continuas

## Distribución normal

# Sea X la altura de los hombres en una población
# sigue una distribución normal.

# En promedio los hobmres miden 170 cm,
# con una desviación estándar de 10 cm

# Cuál es la probabilidad de que al seleccionar a un
# hombre de manera aleatoria su altura esté entre
# 160 y 180cm?


pnorm(q = 180, mean = 170, sd = 10) - 
  pnorm(q = 160, mean = 170, sd = 10) 


# Cuál es la probabilidad de que mida menos de 150 cm?

pnorm(q = 150, mean = 170, sd = 10)

# que mida más de 2 metros...
# forma 1
1 - pnorm(q = 200, mean = 170, sd = 10)

# forma 2
pnorm(q = 200, mean = 170, sd = 10,lower.tail = F)


## Teniendo una persona que mida 1.95 metros, qué
# tan probable hubiese sido encontrarla en
# nuestra población?

##....


## Que altura estaría asociada a una probabilidad del
# 5%?

qnorm(p = 0.05, mean = 170, sd = 10)
