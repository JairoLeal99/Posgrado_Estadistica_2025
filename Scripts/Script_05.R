# JAIRO ALBERTO LEAL GOMEZ
# 25/09/2025
# SEMANA 8

# SCRIPT 4 

# Regresion Lineal Simple

# Variable x es independiente, o explicativa o exogena
# Variable y es dependiente o respuesta o endogena

# Ejemplos
# Crecimiento de arboles, DAP y altura total
# Hidrologia, caudal del rio y la precipitacion acumulada
# Pesca, peso de un pez, longitud total

# Causalidad, entender la realcion causa y efecto

# Tipos de relacion: determinista y no determinista, lineal (positiva y negativa), 
# no lineal (por ej. logaritmica), ausencia de correlacion

# El modelo de regresion lineal simple
# beta 0 es el intercepto
# beta 1 es la pendiente

# Metoedo de minimos cuadrados

# Ejercicio 1

trigo <- c(30, 28, 32, 25, 25, 25, 22, 24, 35, 40)
precio <- c(25, 30, 27, 40, 42, 40, 50, 45, 30, 25)

datos <- data.frame(trigo, precio)

datos

sumxi_yi <- sum(datos$trigo*datos$precio)
sumxi_yi

nxy <- length(datos$trigo)*mean(datos$trigo)*mean(datos$precio) 
nxy

    # length para sacar n
    length(datos$trigo)

sumxi_yi - nxy

x12 <- sum(datos$trigo^2)
x12

nx2 <-  length(datos$trigo)*mean(datos$trigo)^2
nx2


b1 <- (sumxi_yi - nxy) / (x12 - nx2)
b1

bo <- mean(datos$precio) - b1*mean(datos$trigo)
bo

# Función de modelo lineal

lm(formula = datos$precio ~ datos$trigo)

fit.lm <- lm(datos$precio ~ datos$trigo)
summary(fit.lm)

    sqrt(0.6824)
    # es igual a la correlacion y es basanta fuerte

anova(fit.lm)

# Libreria de modelos de regresion

library(lmtest)

# Revisar la posible heterocedasticidad o homocedasticidad
bptest(fit.lm) 

fit.lm$model
fit.lm$coefficients
fit.lm$residuals
mean(fit.lm$residuals)

datos$yprima <- 74.11 - 1.3536 * datos$trigo
datos$recta <- fit.lm$fitted.values
datos$prima <- bo + b1 * datos$trigo

datos$residuales <- datos$precio-datos$recta
SSE <- sum(datos$residuales^2)
SSE/8
sqrt(SSE/8)
