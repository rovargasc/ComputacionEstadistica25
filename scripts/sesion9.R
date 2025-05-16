data("iris")

## Gráfico de dispersión

data("mtcars")

plot(x = mtcars$wt, y = mtcars$mpg)

# llenar puntos
plot(x = mtcars$wt, y = mtcars$mpg, pch = 17,
     col = "red", xlab = "Peso en libras",
     ylab = "Millas por galón")

plot(mtcars)

### ggplot2

x11()

library(ggplot2)

## capa 1: Datos

ggplot(data = mtcars)

# Capa 2: Aesthetics

ggplot(data = mtcars, aes(x = wt, y = mpg)) 

# Capa 3: Geomettría

ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point()


# Metiéndole emoción

ggplot(data = mtcars, 
       aes(x = wt, y = mpg, size = hp,color = cyl)) +
  geom_point()

class(mtcars$cyl)

mtcars$cyl2 = as.factor(mtcars$cyl)
ggplot(data = mtcars, 
       aes(x = wt, y = mpg, size = hp,color = cyl2)) +
  geom_point()

class(mtcars$am)

mtcars$am2 = as.factor(mtcars$am)


ggplot(data = mtcars, 
       aes(x = wt, y = mpg, size = hp,
           color = cyl2, shape = am2)) +
  geom_point()

### vs

ggplot(data = mtcars, 
       aes(x = wt, y = mpg, size = hp,
           color = cyl2, shape = am2)) +
  geom_point() + 
  facet_grid(~vs)




## hagamos otro gráfico...


ggplot(data = mtcars, aes(x = mpg)) +
  geom_histogram(col = "red", fill = "blue")


ggplot(data = mtcars, aes(x = mpg)) +
  geom_boxplot(col = "red", fill = "blue") +
  coord_flip()


ggplot(data = mtcars, aes(x = mpg, y = wt)) +
  geom_point(col = "red", fill = "blue") +
  coord_flip() + geom_boxplot()


install.packages("gapminder")

library(gapminder)

data("gapminder")


pg = ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent,size = pop, alpha = 0.7))


# puedo hacer lo siguiente

pg + facet_grid(. ~ continent)

## capa de estadísticas...

pg + facet_grid(. ~ continent) + 
  geom_smooth(method = "lm", col = "red") 

# Escala logarítmica

pg + facet_grid(. ~ continent) + 
  geom_smooth(method = "lm", col = "red") +
  scale_x_log10() +
  theme_bw() +
  labs(title ="Relación entre PIB y esperanza de vida",
       x = "PIB per cápita (escala logarítmica",
       y = "Esperanza de vida", 
       color = "Continente",
       size = "Población")

install.packages("esquisse")

library(esquisse)

esquisse::esquisser()

library(dplyr)
library(ggplot2)

gapminder %>%
 filter(year >= 1978L & year <= 2007L) %>%
 ggplot() +
 aes(x = gdpPercap, y = lifeExp, colour = continent) +
 geom_point() +
 scale_color_hue(direction = 1) +
 scale_x_continuous(trans = "log10") +
 labs(title = "Increíble gráfico", subtitle = "toy emocionao") +
 theme_minimal()

ggsave("mi_super_Grafico.png", bg = "white",width = 5,height = 6)

getwd()
