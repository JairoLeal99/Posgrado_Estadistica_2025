# Laboratorio 1: Empezar con R y RStudio 
# Trabajar con datos en R
# Jairo Alberto Leal Gómez
# Matricula 1723093
# DCOMRN 1 semestre - Estadistica en la Investigación Cientiica

# Parte 1 R y RStudio -----------------------------------------------------

# Primer contacto con la consola de R

# Por ejemplo, considere las facturas mensuales de una estudiante universitaria
# de la MCF: teléfono celular $ 300, transporte $ 240, comestibles $ 1527, 
# gimnasio $ 400, alquiler $ 1500, otros $ 1833.

# Gastos totales
300 + 240 + 1527 + 400 + 1500 + 1833

# Por ejemplo, podrás crear un objeto llamado celular para los gastos de 
# facturación de telefonía celular, después inspecciona el objeto creado.

celular <- 300
celular

# Realiza más asignaciones para crear variables de transporte, comestibles, 
# gimnasio, alquiler y otros con sus montos correspondientes.

transporte <- 240
comestibles <- 1527
gimnasio <- 400 
alquiler <- 1500
otros <- 1833

#  Ahora que tiene todas las variables, cree un objeto total con la suma de 
# los gastos:

celular + transporte + comestibles + gimnasio + alquiler + otros

# Suponiendo que la estudiante tiene los mismos gastos todos los meses, 
# ¿cuánto gastaría durante un semestre escolar? 
# (suponga que el semestre implica cinco meses).

celular + transporte + comestibles + gimnasio + alquiler + otros
5800 * 5

# ¿cuánto gastaría la estudiante durante un año escolar? 
# (suponga que el año académico es de 10 meses).

5800 * 10

# Autoevaluación

#Toma los objetos creados de la estudiantes (i.e variables) transporte, 
#comestibles, gimnasio, alquiler y otros y escribamos dentro de la función de 
#combinación c() para crear un vector llamado gastos:

gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)

#Ahora, use la función gráfica barplot() para producir un diagrama de barras de gastos

barplot(gastos)

# Descubra cómo utilizar sort() para ordenar los elementos en la variable gastos, 
# con el fin de organizar elementos en gastos en orden decreciente.

help(sort)

# Descubra cómo utilizar sort() y barplot() para producir un gráfico de barras 
# con barras en orden decreciente.

gastos1 <- sort(gastos, decreasing = TRUE)

barplot(gastos1)

# Opcional: ve si puedes descubrir cómo mostrar los nombres de las variables 
# debajo de cada una de las barras

names(gastos1) <- c("Otros", "Comestibles", "Alquiler", "Gimnasio", "Celular", 
                    "Transporte")

barplot(gastos1,
        main = "Gastos por mes",
        ylab = "Costo",
        col= "yellow")




# Parte 2 Variables -------------------------------------------------------

# PROBLEMA 1

# Identifique el tipo de variable (cualitativa o cuantitativa) para la lista de 
# preguntas de una encuesta aplicada a estudiantes universitarios en una 
# clase de estadística:

  # Nombre de estudiante.
  # Fecha de nacimiento (p. Ej., 21/10/1995).
  # Edad (en años).
  # Dirección de casa (por ejemplo, 1234 Ave. Alamo).
  # Número de teléfono (por ejemplo, 510-123-4567).
  # Área principal de estudio.
  # Grado de año universitario: primer año, segundo año, tercer año, último año.
  # Puntaje en la prueba de mitad de período (basado en 100 puntos posibles).
  # Calificación general: A, B, C, D, F.
  # Tiempo (en minutos) para completar la prueba final de MCF 202.
  # Numero de hermanos

cualitativa <- c("nombre de estudiante", "dirección de la casa", 
                 "area principal de estudio",
               "grado de año", "calificacion general")

cuantitativa <- c("fecha de nacimiento", "edad", "puntuaje en la prueba", 
                  "tiempo", "numero de hermanos")

# PROBLEMA 2

# Elija un objeto (cualquier objeto, por ejemplo, animales, plantas, países, 
# instituciones, etc.) y obtenga una lista de 14 variables: 7 cuantitativas 
# y 7 categóricas

animal.cualitativa <- c("especie", "clase taxonomica", "ecosistema", "tipo de dieta",
                       "estatus de conservacion", "tipo de reproducción", 
                       "tipo de actividad principal")

animal.cuantitativa <- c("peso", "altura", "longitud del cuerpo", "edad", 
                         "numero de crias por camada",
                         "frecuencia cardiaca", "velocidad al correr")

# PROBLEMA 3

# Considere una variable con valores numéricos que describen formas electrónicas 
# de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico; 
# 3 = mensaje de texto; 4 = Facebook; 5 = blog. 
# ¿Es esta una variable cuantitativa o cualitativa? Explique

    # Esta variable aunque esté representada con números, es cualitativa
    # Los valores 1, 2, 3, 4, 5 no representan cantidades ni valores medibles, 
    # sino categorías (Twitter, correo electrónico, mensaje de texto, Facebook, blog).
    # No existe un orden entre ellas

# PROBLEMA 4

# Para cada pregunta de investigación, (1) identifique a los individuos de interés 
# (el grupo o grupos que se están estudiando), (2) identifique la (s) variable (s) 
# (la característica sobre la que recopilaríamos datos) y (3) determine si cada 
# variable es categórico o cuantitativo

    # ¿Cuál es la cantidad promedio de horas que los estudiantes de universidades 
    # públicas trabajan cada semana?
    
        # Individuos de interes = estudiantes de universidades publicas
        # Variables = cantidad promedio de horas trabajadas cada semana
        # Tipo de variable = cuantitativa (se mide en horas)

    # ¿Qué proporción de todos los estudiantes universitarios de México están 
    # inscritos en una universidad pública?

        # Individuos de interes = todos los estudiantes universitarios de México
        # Variables = tipo de universidad (publica o privada)
        # Tipo de variable = categorica (publica/privada)

    # En los universidades públicas, ¿las estudiantes femeninas tienen un promedio 
    # de CENEVAL más alto que los estudiantes varones?

        # Individuos de interes = estudiantes
        # Variables = genero (femenino/masculino) y puntuaje de CENEVAL
        # Tipo de variable = genero es categorica y puntuaje es cuantitativo 

    #  ¿Es más probable que los atletas universitarios reciban asesoramiento 
    # académico que los atletas no universitarios?
    
        # Individuos de interes = atletas universitarios y no univeristarios
        # Variables = estatus de atleta (estudia o no estudia), recibir asesoramiento (si/no)
        # Tipo de variable = categoricas

    #  Si reuniéramos datos para responder a las preguntas de la investigación 
    # anterior, ¿qué datos podrían analizarse mediante un histograma? 
    # ¿Cómo lo sabes?

        # En este caso solo los de las cantidades de horas trabajadas por semana
        # y el de puntujae de ceneval
        # Lo sabemos porque los histogramas manejan datos de variables cuantitativas,
        # es decir numeros

