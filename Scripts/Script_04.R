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

datos.aov <- aov(datos$yield ~ datos$fertilizer)
summary(datos.aov)

# + para comparar dos variables
# * interacción


# LSD DETERMINAR EL VALOR Diferencia Mínima Significativa

qt(0.975, 93)

sqrt((2*0.3859)/32) * qt(0.975, 93)

tapply(datos$yield, datos$fertilizer, mean)

# F1 vs F2

176.9332 - 176.7570 # NO SUPERA EL VALOR DE LSD 0.3083992

# EL valor entre las medias, debe ser mayor que el LSD para que sean diferentes

# F2 vs F3

176.9332 - 177.3562 # SUPERA EL VALOR DE LSD 0.3083992

# F1 vs f3

176.7570 - 177.3562  # SUPERA EL VALOR DE LSD 0.3083992

# LSD ES MAS ROBUSTA PARA LA COMPARACIÓN DE LAS DIFERENCIAS

sqrt((2*0.3859)/32) * qtukey(0.95, nmeans = 3, df = 93)

0.3083992 # 300 kilos de dif con LSD mas sensible

0.5231185 # 500 kilos de dif con Tukey menos sensible

TukeyHSD(datos.aov)
plot(TukeyHSD(datos.aov))


library(ggplot2)

ggplot(datos, aes(x=fertilizer, y = yield, fill= fertilizer))+ 
  geom_violin()+
  geom_jitter()+
  theme_light()




