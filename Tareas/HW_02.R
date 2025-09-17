# HW_02, Asginación 3 Contraste de medias
# Trabajar con datos en R
# Jairo Alberto Leal Gómez
# Matricula 1723093
# DCOMRN 1 semestre - Estadistica en la Investigación Cientiica


# Base de datos iris ------------------------------------------------------


# La base de datos iris es uno de los conjuntos de datos más utilizados en 
# estadística y aprendizaje automático. Fue introducida por el estadístico y 
# biólogo Ronald A. Fisher (1936) en su artículo The use of multiple measurements 
# in taxonomic problems

iris
iris <- iris
head(iris)


# Ejercicio ---------------------------------------------------------------

# Primer contacto con R

    #  Selección de especies: elija las especies versicolor y virginica de la base 
    # y enfoque su análisis en la variable Petal.Length
    
    data_sub <- subset(iris, Species %in% c("versicolor", "virginica"))
    
    # Explorar la base de datos iris usando funciones como head(), summary()
    
    head(data_sub)
    summary(data_sub)
    
    # Identificar las variables Petal.Length y determina las estadísticas 
    # descriptivas para las dos especies.

    summary(data_sub$Petal.Length)
    data_sub
    versicolor <- data_sub$Petal.Length[data_sub$Species == "versicolor"]
    virginica <- data_sub$Petal.Length[data_sub$Species == "virginica"]
    
    mean(versicolor)
    summary(versicolor)
    mean(virginica)
    summary(virginica)

# Prueba estadistica
    
    # Defina una pregunta de investigación sobre la variable Petal.Length
    
      # ¿Existe una diferencia significativa en la longitud de los pétalos 
      # (Petal.Length) entre dos especies de Iris?
    
    # Plantee formalmente las hipótesis estadísticas para una prueba t 
    # de dos muestras independientes (two.sided).
    
      # Ho = no hay diferencia en la longitud promedio de los pétalos
      # H1 = sí hay diferencia en la longitud promedio de los pétalos
    
    # Ejecute la prueba en R justificando el tipo de prueba (Welch cuando las
    # varianzas son diferentes o clásica, cuando las varianzas son iguales).
      
      var.test(versicolor, virginica)
      
      # Si p-value < 0.05 → varianzas diferentes → Welch
      # Si p-value >= 0.05 → varianzas iguales → t-test clásico
      
      t.test(versicolor, virginica, alternative = "two.sided", 
             var.equal = T, paired = T)
    
    # Calcule e interprete el tamaño del efecto (Cohen’s d).
    
      library(effsize)
      
      help("cohen.d")
      
      cohen.d(versicolor, virginica, hedges.correction = TRUE)
     
# Visualización
      
      # Genere una gráfica comparativa (boxplot, violinplot, etc.) que muestre 
      # las diferencias entre especies.
      
      data <- c("I. versicolor", "I. virginica")
      
    boxplot(versicolor, virginica,
              main = "Longitud de petalo (Iris)",
              col= c("purple","magenta"),
              notch= TRUE,
              ylab = "Longitud (cm)",
              names = data)
      
      library(vioplot)
      vioplot(versicolor, virginica, 
              main = "Longitud de petalo (Iris)",
              col= c("purple","magenta"),
              ylab = "Longitud (cm)",
              names = data)
      

 # Informe Final
      

# Planteamiento del problema e hipótesis

  # El dataset iris constituye uno de los conjuntos de datos más empleados en análisis 
  # estadístico y biológico. Una de las variables medidas es la longitud del pétalo 
  # (Petal.Length), que varía entre las tres especies registradas.
  
  # La pregunta de investigación fue: ¿Existe una diferencia significativa en 
  # la longitud de los pétalos entre Iris versicolor e Iris virginica?
  
  # Para responderla, se plantearon las siguientes hipótesis estadísticas:
    
    # Ho = no hay diferencia en la longitud promedio de los pétalos
    # H1 = sí hay diferencia en la longitud promedio de los pétalos
      
# Resultados numéricos y gráficos
    
      var.test(versicolor, virginica)
        
  # Se realizó una prueba F de homogeneidad de varianzas, la cual indicó que 
  # las varianzas no son significativamente diferentes entre si (p > 0.05), 
  # por lo que se cumple con el supuesto de homogeneidad de varianzas, lo que 
  # justifica el hecho de utilizar una prueba clasica de t, asi mismo, se
  # procedio a realizar una prueba de Cohen's
     
  # A continuación se muestran los valores promedios y resumen estadistico de
  # cada especie, asi como los resultados de las pruebas de t y de Cohen.

      # Longitud promedio del petalo de Iris versicolor: 4.26 cm
          
          mean(versicolor)
          summary(versicolor)
      
      # Longitud promedio del petalo de Iris virginica: 5.552 cm
          
          mean(virginica)
          summary(virginica)    
      
      # Resultado prueba t con un p-value < 2.562e-16 (< 0.001)
      
          t.test(versicolor, virginica, alternative = "two.sided", 
                 var.equal = T, paired = T)
      
      # Resutlado prubea de Cohen´s d = -2.501415 (large o diferencia muy grande)
          
          cohen.d(versicolor, virginica, hedges.correction = TRUE)
      
  # Gráficamente, la separación o difrencia ente la longiud del petalo de ambas
  # especies es clara (Figura 1).
      
     boxplot(versicolor, virginica,
              main = "Longitud de petalo (Iris)",
              col= c("purple","magenta"),
              notch= TRUE,
              ylab = "Longitud (cm)",
              names = data)
     
     vioplot(versicolor, virginica, 
             main = "Longitud de petalo (Iris)",
             col= c("purple","magenta"),
             ylab = "Longitud (cm)",
             names = data)
      
# Interpretación estadística y biológica
  
  # El análisis estadístico mostró diferencias significativas (p < 0.001) en la
  # longitud promedio de los pétalos entre Iris versicolor y Iris virginica 
  # El tamaño del efecto (Cohen’s d = -2.5) confirma que la magnitud de esta 
  # diferencia es muy grande, lo cual implica una clara separación entre las 
  # especies en este rasgo morfológico.
      
  # Desde una perspectiva biológica, la longitud de pétalos representa un 
  # carácter floral clave para la atracción de polinizadores y un criterio
  # taxonómico robusto para distinguir entre especies. De esta forma, la evidencia 
  # estadística respalda la importancia de la morfología floral como un rasgo 
  # diferenciador entre Iris versicolor e Iris virginica.    
      
    