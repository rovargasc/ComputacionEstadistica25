### cuantiles en distribuciones de probabilidad


plot(curve(dnorm(x), from = -3, to = 3), type = "l")

# qué valor de x separa el 90% de los datos
# más bajos del 10% de los datos más altos?

qnorm(p = 0.9, mean = 0, sd = 1)

abline(v = 1.28, col = "red")


### Muestreo aleatorio simple (sin reemplazo)

estudiantes = c("Juliana", "Miguel",
                "Gladys", "Mateo","Laura")

## muesteo en R
# Obtengamos u nestudiante al azar
sample(x = estudiantes, size = 1)

sample(x = estudiantes, size = 3)

##
massr = sample(x = estudiantes, size = 3)
massr

# semilla
set.seed(12345)
massr = sample(x = estudiantes, size = 3)
massr

set.seed(12345)
massr = sample(x = estudiantes)
massr

estudiantes


estudiantes = Exposiciones_Computación_2025_1$`Expositores (máximo 3)`

estudiantes = na.omit(estudiantes)

estudiantes


set.seed(8378)

exposiciones = sample(estudiantes)


writexl::write_xlsx(as.data.frame(exposiciones), "exposiciones.xlsx")


set.seed(12345)
massr = sample(x = estudiantes, size = 8)
massr


## Muestreo aleatorio simple con reemplazo

# usamos sample con el argumento replace = TRUE
massr = sample(x = estudiantes, size = 8, replace = T)
massr



data(mtcars)

n = nrow(mtcars)
n
set.seed(573)

muestra = sample(1:n, size = 10)
muestra

# MEDIA POBLACIONAL
mean(mtcars$mpg)

seleccionados = mtcars[muestra, ]

seleccionados

mean(seleccionados$mpg)


## Aplicación de MASCR: Bootstrap
B = 5000 # número de repeticiones
promedios = numeric(B)

for(i in 1:B){  # 1000 repeticiones
  # Muestra de tamaño 50, MASCR
  muestra = sample(1:n, size = 10, replace = TRUE)
  # Obtengo muestra
  sel = mtcars[muestra,]
  # Obtengo promedio de variable que quiero estimar
  prom = mean(sel$mpg)
  # Guardo promedio encontrado en i-esima posicion
  promedios[i] = prom
}

promedios


mean(promedios)


IC = quantile(promedios, probs = c(0.025, 0.975))

IC
