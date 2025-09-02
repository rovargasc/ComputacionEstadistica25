data("iris")

boxplot(iris$Sepal.Width)

cajita = boxplot(iris$Sepal.Width)

cajita$stats

cajita$out

atipicos = which(iris$Sepal.Width %in% cajita$out)
atipicos

iris[atipicos,]

boxplot(iris$Sepal.Width ~ iris$Species)
