# HW_03
# Ejercicio: comparación de concentraciones  de estroncio en cuerpos de agua
# Jairo Alberto Leal Gómez
# Matricula 1723093
# DCOMRN 1 semestre - Estadistica en la Investigación Cientifica

# Descripción -------------------------------------------------------------

# Un investigador midió la concentración de estroncio (mg/ml) en cinco cuerpos 
# de agua para evaluar si existen diferencias significativas entre ellos. 
# Cada sitio tuvo 6 réplicas (n-6).

estroncio <- read.csv("estroncio.csv", header = TRUE)
estroncio

estroncio2 <- read.csv("estroncio2.csv", header = TRUE)
estroncio2

# Planteamiento del problema ----------------------------------------------

estroncio_ordenado <- estroncio[, order(names(estroncio))]

boxplot(estroncio_ordenado,
        xlab = "Lugar",
        ylab = "(mg/ml)",
        main = "Concentración de estroncio",
        col = rainbow(5))

  # La Figura 1 muestra las concentraciones de estroncio (mg/ml) registradas 
  # en cinco cuerpos de agua: Grayson's Pond, Beaver Lake, Angler's Cove, 
  # Appletree Lake y Rock River. 
  # Cada sitio contó con seis repeticiones independientes.
  
  # Se observa que Rock River presenta las concentraciones más elevadas, 
  # con valores consistentemente superiores al resto de los sitios.
  # En contraste, Grayson's Pond mostró los niveles más bajos, mientras que 
  # Beaver Lake, Angler's Cove y Appletree Lake presentaron valores intermedios 
  # y relativamente cercanos entre sí.
  
  # Este patrón sugiere la existencia de diferencias significativas entre sitios, 
  # lo cual motiva la aplicación de un ANOVA de una vía, seguido de 
  # pruebas post-hoc (LSD y Tukey HSD) para identificar con precisión 
  # qué grupos difieren estadísticamente en sus medias.


# HIPOTESIS DE LA ANOVA

  # H0 = Todas las medias de concentración de estroncio en los cinco cuerpos de agua
  # son iguales. No existe diferencia significativa entre los sitios.
  
  # H1 = Al menos un sitio presenta una media distinta de concentración de 
  # estroncio respecto a los demás. Existen diferencias significativas.

  estroncio2

# PRUEBA DE NORMALIDAD

  # p-value = 0.1052 no hay diferencias significativas datos normales
  shapiro.test(estroncio2$concentracion)
  
  # p values mayores a 0.05, no hay diferencias significativas en cada sitio
  shapiro.test(subset(estroncio2$concentracion, estroncio2$sitio == "graysonpond"))
  shapiro.test(subset(estroncio2$concentracion, estroncio2$sitio == "beaverlake"))
  shapiro.test(subset(estroncio2$concentracion, estroncio2$sitio == "anglercove"))
  shapiro.test(subset(estroncio2$concentracion, estroncio2$sitio == "appletreelake"))
  shapiro.test(subset(estroncio2$concentracion, estroncio2$sitio == "rockriver"))
  
# PRUEBA DE ANOVA
  
  estroncio.aov <- aov(estroncio2$concentracion ~ estroncio2$sitio)
  summary(estroncio.aov)
  
  # Con un valor de p value de 3.95e-12 ***, se demuestra que existen diferencias
  # significativas en todas las concentraciones de estroncio entre todos los sitios. 
  # Se rechaza la HIPOTESIS NULA.

# Calcule el valor de LSD con alpha = 0.05.
  
qt(0.975, df= 25)

sqrt((2*9.8)/6) * qt(0.975, df= 25)


# Compare las diferencias entre medias de los sitios

tapply(estroncio2$concentracion, estroncio2$sitio, mean)

# Determine cuales pares son significativamente diferentes

# LSD = 3.722394

# El supuesto es que si el resultado entre la diferencia de medias, supera el LSD
# existen diferencias significativas

# AnglerCove vs AppletreeLake 
44.08333 - 41.10000
# 2.98333 no supera el valor de LSD, NO EXISTE DIF SIGNIFICATIVAS

    # AnglerCove vs BeaverLake   
    44.08333 - 40.23333
    # 3.85 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # AnglerCove vs GraysonPond     
    44.08333 - 32.08333
    # 12 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # AnglerCove vs RockRiver      
    44.08333 - 58.30000
    # 14.21 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS

# AppletreeLake vs BeaverLake   
41.10000 - 40.23333      
# 0.86667 no supera el valor de LSD, NO EXISTE DIF SIGNIFICATIVAS

    # AppletreeLake vs GraysonPond     
    41.10000 - 32.08333      
    # 9.01667 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # AppletreeLake vs RockRiver 
    41.10000 - 58.30000 
    # 17.2 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # BeaverLake vs GraysonPond     
    40.23333 - 32.08333      
    # 8.15 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # BeaverLake vs RockRiver 
    40.23333  - 58.30000 
    # 18.06667 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS
    
    # GraysonPond vs RockRiver 
    32.08333 - 58.30000 
    # 26.21667 Supera el valor de LSD, DIFRENECIAS SIGNIFICATIVAS

# Solo AnglerCove vs AppletreeLake y AppletreeLake vs BeaverLake 
# no muestran diferencias significativas.

# Todos los demás pares superan el LSD y son significativamente diferentes.
    
# PRUEBA DE TUKEY HSD

    # Obtenga el valor critico
    
    TukeyHSD(estroncio.aov)
    plot(TukeyHSD(estroncio.aov))
    
    # Calcule la diferencia minima significativa con Tukey
    qtukey(0.95, nmeans = 5, df = 25)
    sqrt((9.8/6)) * qtukey(0.95, nmeans = 5, df = 25)
    
    # Compare los resultados con la prueba LSD

# DMS = 5.308078

# El supuesto es que si el resultado entre la diferencia de medias, supera el DMS
# existen diferencias significativas

# AnglerCove vs AppletreeLake 
44.08333 - 41.10000
# 2.98333 no supera el valor de DMS, NO EXISTE DIF SIGNIFICATIVAS

# AnglerCove vs BeaverLake   
44.08333 - 40.23333
# 3.85 no supera el valor de DMS, NO EXISTE DIF SIGNIFICATIVAS

    # AnglerCove vs GraysonPond     
    44.08333 - 32.08333
    # 12 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS
    
    # AnglerCove vs RockRiver      
    44.08333 - 58.30000
    # 14.21 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS

# AppletreeLake vs BeaverLake   
41.10000 - 40.23333      
# 0.86667 no supera el valor de DMS, NO EXISTE DIF SIGNIFICATIVAS

    # AppletreeLake vs GraysonPond     
    41.10000 - 32.08333      
    # 9.01667 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS
    
    # AppletreeLake vs RockRiver 
    41.10000 - 58.30000 
    # 17.2 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS
    
    # BeaverLake vs GraysonPond     
    40.23333 - 32.08333      
    # 8.15 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS
    
    # BeaverLake vs RockRiver 
    40.23333  - 58.30000 
    # 18.06667 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS
    
    # GraysonPond vs RockRiver 
    32.08333 - 58.30000 
    # 26.21667 Supera el valor de DMS, DIFRENECIAS SIGNIFICATIVAS   
    
    
# ¿Los mismos pares resultan significativos?

    # En este caso, a excepcion de AnglerCove vs BeaverLake que ahora no presenta
    # diferencias significativas, todos los demas siguen igual
    

    

# INTERPRETACION ----------------------------------------------------------

# ¿ QUE CUERPO DE AGUA PRESENTA LAS CONCENTRACIONES MAS ALTAS ?
    
    # Rock River, con un promedio de 58.3 mg/ml, es el sitio con las concentraciones 
    # más altas de estroncio.
    
    # En contraste, GraysonPond tiene las concentraciones más bajas (32.08 mg/ml).
    
    tapply(estroncio2$concentracion, estroncio2$sitio, mean)
  

# ¿ QUE SITIOS NO DIFIEREN ENTRE SI ?
    
    # Según la prueba LSD (alpha = 0.05, LSD = 3.722):

    # AnglerCove vs AppletreeLake → no difieren (2.983 < LSD)
    # AppletreeLake vs BeaverLake → no difieren (0.867 < LSD)

    # Según la prueba Tukey HSD (DMS = 5.308), más conservadora:

    # AnglerCove vs AppletreeLake → no difieren (2.983 < DMS)
    # AppletreeLake vs BeaverLake → no difieren (0.867 < DMS)
    # AnglerCove vs BeaverLake → ahora tampoco difieren (3.85 < DMS)
    
    # Los sitios intermedios (BeaverLake, AppletreeLake, AnglerCove) 
    # presentan algunas diferencias no significativas entre ellos.
    
    # RockRiver y GraysonPond siempre difieren significativamente de los demás.

# DESDE EL PUNTO DE VISTA AMBIENTAL ¿ QUE IMPLICACIONES PODRIAN TENER ESTAS 
# DIFERENCIAS EN AL CALIDAD DEL AGUA? 
    
    # En Rock River, al tener concentraciones mas altas de estroncio, puede indicar
    # una mayori disolucion de este mineral en suelo y rocas por la escorrentia o
    # presencia de agua, o por actividades mineras o procesamiento de este.
    
    # En concentraciones mayores o sobre todo del estroncio isotopo 90 puede 
    # representar un mayor riesgo a la salud humana y ambiental de la fauna, al 
    # llegar a ser radioactivo
    
    # Los sitos con menores concentraciones o intermedias, pudieran estar dentro
    # de los rangos normales o naturales.

    