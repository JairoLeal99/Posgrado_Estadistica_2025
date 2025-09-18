# JAIRO ALBERTO LEAL GOMEZ
# 18/09/2025
# SEMANA 7

# SCRIPT 4

datos <- read.csv("Scripts/crop.csv", header =  T)
datos

summary(datos)

# Las variables estan en numeros integrales y hay que modificar a factores
# Ya que el experimento hara la comparación por factores

datos$density <- as.factor(datos$density)
datos$block <- as.factor(datos$block)
datos$fertilizer <- as.factor(datos$fertilizer)

summary(datos)

boxplot(datos$yield ~ datos$fertilizer,
        main = "Producción por fertilizante",
        col= c("red2","blue2", "green2"),
        ylab = "Producción",
        xlab = "Tipo de fertilizante",
        ylim = c(175, 179))

library(vioplot)
vioplot(datos$yield ~ datos$fertilizer,
        main = "Producción por fertilizante",
        col= c("red2","blue2", "green2"),
        ylab = "Producción",
        xlab = "Tipo de fertilizante",
        ylim = c(175, 179))

tapply(datos$yield, datos$fertilizer, mean)
tapply(datos$yield, datos$fertilizer, sd)
tapply(datos$yield, datos$fertilizer, var)

# Prueba de normalidad

shapiro.test(datos$yield)

# Prueba de normalidad

shapiro.test(subset(datos$yield, datos$fertilizer == "1"))
shapiro.test(subset(datos$yield, datos$fertilizer == "2"))
shapiro.test(subset(datos$yield, datos$fertilizer == "3"))

# No hay diferencias significativas, los datos son normales

# Prueba homogeneidad de varianzas

# VAR.TEST ES PARA DOS FACTORES, DOS GRUPOS CON VARIANZAS
# var.test(datos$yield ~ datos$fertilizer) 

bartlett.test(datos$yield ~ datos$fertilizer)

# No hay diferencias entre las varianzas







