rm(list = ls()) # limpiar el ambiente

## sesión 3,

## Funciones, bucles, leer archivos


## Motivación

## interés compuesto

# tengo 1000$, los invierto por 
# 1 año a uan tasa de interes del 10%


C0 = 1000
t = 1
i = 0.10

M = C0*(1 + 0.1)^1


## si ahora quiero dejarlo por 2 años?

C0 = 1000
t = 2
i = 0.10

M = C0*(1 + i)^t
M


# creemos una función que haga los cálculos

interes_compuesto = function(C0, i, t){
  M = C0*(1 + i)^t
  return(M)
}


interes_compuesto(C0 = 1000, i = 0.10, t = 1)

# análogo (pilas con la posición)

interes_compuesto(1000, 0.10, 1)

interes_compuesto(0.10,1000, 1)

interes_compuesto(t = 1, i = 0.10, C0 = 1000)

## argumentos por defecto
interes_compuesto(C0 = 1000, i = 0.1)

interes_compuesto2 = function(C0, i, t = 1){
  M = C0*(1 + i)^t
  return(M)
}

interes_compuesto2(C0 = 1000, i = 0.1)


##### Estructuras de selección...


ingreso = 150

if(ingreso > 1000){
  print("Tocó hamburguesita...")
}


## if - else

ingreso = 100
if(ingreso > 1000){
  print("Hamburguesita")
  
}else{
  print("Toco recalentao papá...")
}


## función ifelse

ingles = c(10, 11, 4, 8, 10)

ifelse(ingles > 9, "No nivela", "Nivela")

## qué pasa si tengo más de 2 niveles?...

# puntaje < 5: Nivel I
# putnaje < 10: Nivel II
# Puntaje >= 10: No nivela, un Dios en inglés

ifelse(ingles < 5, "Nivel I",
       ifelse(ingles < 10, "Nivel II", "No nivela"))


# Bucles - estructuras de repeticion #####

# Motivacion

asignaturas = c("Integral", "Fundamentos", "Probabilidad")

# quiero imprimir una a una las asignaturas que tengo

asignaturas[1]
asignaturas[2]
asignaturas[3]


for(i in 1:3){
  print(asignaturas[i])
}


1:3 ## Código quemado
asignaturas = c("Integral", "Fundamentos", "Probabilidad", "Cátedra")

1:length(asignaturas)


persona_asignaturas = function(estudiante, asignaturas, calificaciones) {
  for(i in 1:length(asignaturas)) {
    print(paste0("El estudiante ", estudiante, " cursó ", asignaturas[i], 
                 " con calificación: ", calificaciones[i]))
  }
}

persona_asignaturas("Juan David", c("Proba", "Integral"), c(4.3, 4.6))


### Abrir datos 

plot(cafe)



library(readxl)
cafe <- read_excel("Bases de datos-20250408/cafe.xlsx", 
                   sheet = "1. Precio Interno Diario ", 
                   range = "B6:C7030")
View(cafe)

