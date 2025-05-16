# Sesión 6

# Agenda
### groupby múltiple
## operadonr %in5 in filter
## joins
## gráficos paquete base

##
library(dplyr)
marketing %>% group_by(Education) %>% 
  summarise(Ingreso = mean(Income))

# Agrupemops por Education y Marital_Status

marketing %>% group_by(Education, Marital_Status) %>% 
  summarise(Ingreso = mean(Income))


marketing %>% group_by(Marital_Status, Education) %>% 
  summarise(Ingreso = mean(Income))


## Filtremos los individuos que están casados

marketing %>% filter(Marital_Status == "Married")

# quiero las personas que sean casadas o divorciadas...
# nivel pollito
marketing %>% filter(Marital_Status == "Married" | Marital_Status == "Divorced")

# nivel tigrito
marketing %>% filter(Marital_Status %in% c("Married", "Divorced"))



##### Cruce de tablas (joins)

### quitar notación científica
options(scipen = 99)


pib20 = df_pib %>% filter(año == 2020)

des20 = df_desempleo %>% filter(año == 2020)

infla20 = df_inflacion %>% filter(año == 2020)


## left_join

tabla_left = left_join(pib20, infla20, by = c("pais", "año"))

tabla_left = left_join(pib20, infla20 %>% select(-año), by = "pais")

tabla_right = right_join(pib20, infla20 %>% select(-año), by = "pais")

tabla_right = right_join(pib20, infla20, by = c("pais", "año"))

left_join(df_desempleo, df_inflacion, by = c("pais", "año")) %>% View()

inner_join(df_desempleo, df_inflacion, by = c("pais", "año")) %>% View()

full_join(df_desempleo, df_inflacion, by = c("pais", "año")) %>% View()

#######################

## Gráficos en paquete base ######

### barplots #####

## Sirven para mostrar información de una variable categórica.
# para crearlo es con la función barplot.
# De argumento recibe una tabla (table)

table(marketing$Education)

# pilas, no eestá ordenado

barplot(table(marketing$Education))

x = table(marketing$Education)


barplot(x, main = "Nivel educativo",
        xlab = "Educación", ylab = "Conteo",
        col = "red")


barplot(x, main = "Nivel educativo",
        xlab = "Educación", ylab = "Conteo",
        col = c("red", "violetred4","orange", "green","tomato"))

colors()


barplot(x, main = "Nivel educativo",
        xlab = "Educación", ylab = "Conteo",
        col = c("red", "violetred4","orange", 
                "green","tomato"),horiz = T)


## Histogramas

# Permiten representar una variable numérica

hist(marketing$Income)

hist(marketing$Income, xlim = c(0, 150000), breaks = 30)


histo1 = hist(marketing$Income, xlim = c(0, 150000), breaks = 30)

histo1$breaks

histo1$counts


hist(marketing$Income, xlim = c(0, 100000), breaks = 50,
     main = "Histograma", col = c("red","blue"))


### Boxplots

# Para crear un gráfico de caja se usa la función
# boxplot. 

## boxplto de Income

boxplot(marketing$Income)


marketing2 = marketing %>% filter(Income <= 200000)
boxplot(marketing2$Income)

cajita1 = boxplot(marketing$Income)

cajita1$stats

cajita1$out
