## Limpiar el entorno
rm(list=ls())

## instalar/llamar pacman
require(pacman)

## usar la función p_load de pacman para instalar/llamar las librerías de la clase
p_load(rio, # función import/export: permite leer/escribir archivos desde diferentes formatos. 
       skimr, # funcion skim: describe un conjunto de datos
       janitor, # función tabyl: frecuencias relativas
       dplyr) # contiene conjuntos de datos.

## importar datos
data_csv = import(file="input/datos_censo.csv" , skip=6 , encoding="UTF-8")
data_xls = import(file="input/datos_excel.xlsx" , skip=9)

## Exportar a un formato .csv
export(x=data_csv, file="output/data_csv.csv")
## Exportar a un formato .xls
export(x=data_xls , file="output/data_excel.xlsx")

## 2.3 convertir
convert(in_file = "input/datos_censo.csv" , out_file = "output/convert.rds")

## Explorar bases de datos
data(package="dplyr")

## obtener datos
db = as_tibble(x = starwars)

head(x = db , n = 5) ## pinta sobre la consola las primeras 5 observaciones de "db"
tail(db) ## pinta sobre la consola las ultimas 5 observaciones de "db"
str(object = mtcars) ## obtener la estructura del objeto "mtcars"
glimpse(x = db) ## obtener la estructura del objeto "db"
skim(data = db) ## de la librería skimr (resume la base de datos)

## renombrar variables 
colnames(db)
db = rename(.data = db , weigth=mass , height_cm=height) ## de la librería dplyr
colnames(db)

## otra forma
colnames(db)[9] = "genero"
## Poner todo en mayusculas
df = select_all(.tbl=db , toupper)

colnames(data_csv)
##  arreglar los nombres de las variables de las bases
data_csv2 = clean_names(data_csv)
colnames(data_csv2)

