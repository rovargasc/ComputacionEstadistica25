## Boxplot
data("iris")
boxplot(iris$Sepal.Width)
cajita = boxplot(iris$Sepal.Width)
cajita$stats
cajita$out

## Quiero ver las filas que son outliers ...
atipicos = which(iris$Sepal.Width %in% cajita$out)
iris[atipicos,]

## Puedo desagregar una variable categorica
boxplot(iris$Sepal.Width ~ iris$Species)
