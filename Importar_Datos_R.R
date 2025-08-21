# 21/08/2025


# Importar datos ----------------------------------------------------------

# Shift+Ctrl+R para agregar una seccion

# Si el csv esta en mi carpeta de proyecto, solo se ocupa leer el nombre del archivo
datos <- read.csv("inspeccionmovilizacion.csv")
View(datos)

# Para abrir una BD desde un link 
url <- "https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv" 
senasica <- read.csv(url, header = T)
# Header = True para que la primera fila la tome como las variables

