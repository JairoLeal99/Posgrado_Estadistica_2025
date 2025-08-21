# JAIRO ALBERTO LEAL GOMEZ
# 21/08/2025
# SEMANA 2

# EJERCICIO 1

temperatura <- read.csv("C:/JAIRO LEAL/Posgrado_Estadistica_2025/temperatura.csv")
temperatura

temp <- temperatura

View(temp)
head(temp) #primeras 6 filas
dim(temp) #numero de filas y columnas
names(temp) #nombre de las columnas
str(temp) #ver estructura del dataframe 21 obs. of  13 variables

summary(temp) #resumen estadistico
names(temp) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")

temp$media_anual <- rowMeans(temp[,2:13]) 
#la coma para columnas es antes de los numeros, la coma despues de los numeros son para seleccionar filas
#seleccionar temp[,2:13] y en consola aparece las columnas seleccionadas

head(temp)

# SEMANA 3

# Graficar con Boxplot

boxplot(temp) # no funciona asi

temp1 <- temp[ ,2:13] # dejamos solo las columnas de los meses desde ene-dic

colores <- c("paleturquoise3", "paleturquoise3", "paleturquoise3",
             "seagreen3", "seagreen3","seagreen3",
             "sienna2", "sienna2", "sienna2",
             "violetred2", "violetred2", "violetred2")

boxplot(temp1,
        main= "Comportamiento Temperatura (2000-2020)",
        xlab ="Mes",
        ylab ="Temperatura (°C)",
        col= colores,
        border = "black")


