#-------------------------------CLASE 1---------------------------
#---Este paquete traduce lenguaje de R a git
#install.packages("usethis")
#library(usethis)
#use_git_config(user.name = "Acá tu numbre", user.email = "acatumail@example.com")
##Eso lo hago una vez por compu
#user.name=forlinolara, email=lara.rfw@gmail.com

#------GIT------#
#Comandos en terminal para conectar con github - esto lo hago cada vez que
#quiero actualizar de git. Codigo:
#git add -A (agrego los archivos nuevos - A es de ALL, todos los archivos
# diferencias de la versión remota)
#git commit -m "agrego nuevos archivos" - sirve para empaquetar y etiquetar
#"git push" - para actualizar en gitbub

#---Pestaña git 
#ahi podes ver los cambios con respecto a la version remota
#click en commit, podes hacer todo con botonera
#podes poner revert para borrar lo que hiciste de tu script.
#tambien con la flechita o el comando "git push" podes actualizar el repositorio

#preguntas: creas un repositorio con el html de github, en donde se crea la carpeta local?

#Descargar paquetes oficiale - que pasaron por CRAN, no significa trucho - 
#install.packages("nombre_del_paquete")

#Para usar paquetes se pone library una vez por sesion


#-------------------------------CLASE 2---------------------------

#Tidyverse: paquete de paquetes - ggplot, purr, dplyr, readr, tidyr, tibble
library(tidyverse)
#Dialectos para R: R base vs Tidyverse
#Creo objeto, con el comando asignar <- le digo que el objeto es un dataframe compuesto por 5 variables o vectores (sinónimos). Primero vector de texto, luego numérico. Son como columnas. 
curso <- data.frame(nombre     = c("Juan", "Pedro", "María", "José","Enzo", "Ariel", "Eva"),
                    edad       = c(25, 32, 21,40, 30, 28, 37),
                    nacimiento = c(1993, 1986, 1997, 1978, 1988, 1990, 1981),
                    programa   = c("spss", "stata", "stata", "excel", "R", "stata", "spss"),
                    nivel      = c(3, 5,7, 6, 2, 6, 8))

#Si quiero calcular el promedio de edad con R base uso esto:
prueba <-  mean(curso$edad)
#Con $ navego sobre las columnas de la base.

#Con tidyverse

curso$edad %>% 
  mean() %>%
  round(digits = 1)

#Lo que dejo de hacer es especificar el mean sobre quien corre, ya esta a la izquierda del pipe. El pipe sirve para identificar que voy a hacer, en este caso usar mean. 
#round es para redondear, digitos es un parametro de esa funcion. 

#Con R base debería hacer esto para redondear
round(mean(curso$edad), digits = 1)

#Practico. Traducir esto a tidyverse
round(prop.table(table(curso$programa)) * 100, digits = 1)

###ATAJO PIPE CTL+SHIFT+M
#------------------------------------>
#------------------------------------>LISTADO DE ATAJOS ALTL+SHIFT+K
#------------------------------------> Flechita alt -
#Table: sirve para saber la frecuencia de una variable
#prop.table: se hace sobre table y es para saber frecuencia relativa
#round: para redondear

curso$programa %>% 
  table() %>% 
  prop.table() %>% 
  round(digits = 1)*100

#Paquetes para  importar archivos
#Paquete {readr}
#•	read_csv() --> .csv
#•	read_table() --> .txt
#•	read_rds() --> .rds
#Paquete {haven}
#•	read_sav() --> SPSS
#•	read_dta() --> STATA
#•	read_sas() --> SAS

library (readr)
library(haven)

#Descargo Base de datos: https://datos.gob.ar/dataset/otros-inmuebles-propios-estado-nacional-alquilados
#con ctrl + F puedo reemplazar las barras al reves
#Apretando tab sobre la ruta me abre todos los archivos y puedo seleccionar
#También si estoy en un proyecto puedo abrir comillas, tab y ya me sale
inmuebles <- read_csv("C:/Users/laraf/OneDrive/Documentos/MAESTRIA/Genero/utdt/inmuebles-estado-nacional.csv")

#"Alternativa", mejor para compartir con otra persona porque no tiene la ruta.
#Para esto necesitas estar en un proyecto, pero es mas reproducible
#"inmuebles <- read_csv("inmuebles-estado-nacional.csv")



#------------------------CLASE 3--------------------------------------
#importar archivos CSV con R base
inmuebles<-read.csv(file = "inmuebles-estado-nacional.csv",
         encoding = "UTF-8")

#importar CSV con tidyverse
#-- notar que no hace falta aclarar encoding.
inmuebles <-read_csv(file = "inmuebles-estado-nacional.csv")
#-- esto es para separados por coma, hay otros ejemplos en apuntes
#punto y coma, tab, txt, etc

#importar datos XLSX
library(readxl)
read_xlsx(path = "data/arg_presi_gral2003.xlsx")

#otros ejemplos del paquete haven: 
#read_sas() --> SAS
#read_sav() --> SPSS
#read_dta() --> STATA
#read_dta(file =  "data/argentina_ecological_data.dta")

#Aca por ejemplo importas directo de una pagina web, pones el link como la ruta
read_dta(file =  "https://www.noamlupu.com/argentina_ecological_data.dta")

#Base inmuebles, la descargo directo desde url, no hace falta descargar la base
#de datos
library(readr)
b_inmuebles <- read.csv("https://infra.datos.gob.ar/catalog/otros/dataset/6/distribution/6.1/download/inmuebles-estado-nacional.csv")

#opcion de importar desde google drive (sheets)
#install.packages("googlesheets4")
library(googlesheets4)
# Eliminar auth interactivo (link publico)
gs4_deauth() 
read_sheet("https://docs.google.com/spreadsheets/d/1J84PviVxVMsCDzupOcD0_s_yc92vm4sCB6uoJQtl2mU/edit?usp=sharing")

#Otros paquetes: vroom que descubre la extension del archivo
#data.table::fread() importa muy rapido datos muy grandes
#vroom::vroom()
#https://www.tidyverse.org/blog/2019/05/vroom-1-0-0/
#data.table::fread()
#https://rdatatable.gitlab.io/data.table/
#DB (https://db.rstudio.com/)

#datapasta te permite importar con copypaste
#install.packages("datapasta")
library(datapasta)
datapasta <- data.frame(
   stringsAsFactors = FALSE,
  Apellido.y.Nombre = c("Fasola, Juan Pedro",
                        "Soze, Kayser","Bigpear, John Sunday","Tower, JC"),
          Profesión = c("Amigo", "Narcotraficante", "General", "Sociólogo"),
               Edad = c(37L, 58L, 75L, 74L))

#puedo hacer lo mismo haciendo 2 vectores por separado

edad <- c(23,24)
profesion <- c("medico","abogado")

#puedo juntar estos dos vectores (REVISAR)

#paquete janitor: tiene muchas funciones paratratar bases de datos"
#install.packages("janitor")
library(janitor)

#ver que en la base que importamos con datapasta apellido y nombre
#tiene punto y esta cada palabra en mayuscula
#r no te deja crear objetos con espacio. puede tener . o _
#las bases de datos con espacios las borra automaticamente

#podemos resolver todo esto con una función de janitor que se llama
#clean_names
datapasta_limpia <- datapasta %>% clean_names()
#vamos a ver que así estan todas en minusc y con_
#hay otras funciones muy copadas con janitor

## Armo base de datos
b_curso <- tibble::tibble(Apellido.y.Nombre = c("Fasola, Juan Pedro","Soze, Kayser","Bigpear, John Sunday","Tower, JC"),
                          Profesión = c("Amigo", "Narcotraficanet", "General", "Sociólogo"),
                          Lugar.de.Nacimiento = c("Hurlingam", "Los Angeles", "Lobos", "Bahía Blanca")) %>% 
clean_names()

b_curso

#esta base es ancha (tidy), pero la puedo transformar
#a lo largo con PIVOT_LONGER

#originalmente tengo 3 variables x 3 filas.
#quiero que las columnas 2 y 3 esten en una columna
#PARAMETROS
#a) quiero que profesion y lugar de nacimiento esten en una sola
#columna, que se llame variable
#c) quiero que la columna que tenga los valores# se llame valores

b_curso_largo <- b_curso %>% 
  pivot_longer(cols = c(profesion, lugar_de_nacimiento),
               names_to = "variable",
               values_to = "valores")

#PIVOT_WIDER para transformar de largo a ancho
#que cada fila se convierta en variable
#PARAMETROS: de donde saco las variables y de donde saco los valores
#a) saco nombres de variables de column "variables"
#) saco valores de variables de column "valores"
b_curso_ancho <- b_curso_largo %>% 
  pivot_wider(names_from = variable,
              values_from = valores)

#OTRAS FUNCIONES de tidyr
#complete()	Hace explícitos valores missing antes implícitos
#fill()	Cambia el NA por un valor anterior/posterior
#replace_na()	reemplaza valores NA por otro específico
#drop_na()	descarta filas con valores NA en columnas
#VER OTRAS EN PAQUETES TIDYR

#5 FUNCIONES PRINCIPALES {dplyr} 
#principales verbos para manipular la data

#filter(): reduce la cantidad de filas (observaciones)
#-Solo quiero analizar datos de arg, por ejemplo

#select(): reduce la cantidad de columnas (variables)
#-No quiero todas las columnas, solo me interesan 7
#-lo hago porque cada columna extra es más procesamiento

#mutate(): crea o modifica variables
#-creamos nuevas columnas o editamos las ya existente

#arrange(): ordena (sort)
#-ordena una columna en relacion a otra variable ascendente
#-o descendente, como por ingresos. ordena la base

#group_by(): agrupa observaciones
#-agrupa la tabla en funcion de otra variable

#summarize(): reduce múltiples observaciones a un valor
#-valores de resumen

#todas estas funciones devuelven una nueva base de datos.


#////PRACTICA////#
colnames(b_inmuebles)
#me dice todas las columnas, me ahorra abrir la base, 
#especialmente si es muy grande

unique(b_inmuebles$pais)
#me devuelve las categorías uncicas de las variables que selecciono

#b_inmuebles$pais es un vector, me van a repetir mil veces las categorias de
#pais, por eso uso la funcion unique

table(b_inmuebles$pais)
#me devuelve un tabulado multivariado, la frecuencia
#para cada categoria cuenta cuantas veces aparece

b_inmuebles_arg <- b_inmuebles %>% 
  filter(pais=="Argentina")
#el filter usa una condicion para elegir filas
#en este caso quiero que en la col pais diga Arg, uso ==
#como se ve en el environment, veo que hay menos obs.

#como chequeo que no haya otras categorias que no sean argentina?
unique(b_inmuebles_arg$pais)

#------------------------> eliminar objetos del ambiente rm()

table(b_inmuebles_arg$pais)

#quiero quedarme con alguna provincia en particular
unique(b_inmuebles_arg$provincia)

#veo todas las que hay y me quedo con Ciudad Autonoma de Buenos Aires
b_inmuebles_arg <- b_inmuebles %>% 
  filter(pais=="Argentina" & provincia == "Ciudad Autonoma de Buenos Aires")

#uso un & para poner otra condicion en filter
#como no creo otro dataframe se pisan, se transcriben y me quedo con menos obs

### Selecciono variables de trabajo
b_inmuebles_trabajo_V2 <- b_inmuebles %>% 
  select(pais,provincia,superficie_aproximada_m2)

#tiene las misma obs que base original pero solo 3 col

#chequeo que esto se haya ejecutado bien
colnames(b_inmuebles_trabajo)

#puedo hacer lo mismo pero con el nro de col
b_inmuebles_trabajo <- b_inmuebles %>% 
  select(3,4,10)

colnames(b_inmuebles_trabajo)

#no hace falta contar a dedo la posición de la columna
#colnames me pone [] indices

#quiero columnas que empiecen con L
b_v3 <- b_inmuebles %>% 
  select(starts_with("l"))

#tmb estan funciones "ends_with" o "contains"

#puedo combinar criterios
b_seleccion_final <-  b_inmuebles %>% 
  select(1,pais,starts_with("l"),contains("_"))
colnames(b_seleccion_final)


###CREO VARIABLES/Columnas NUEVAS con MUTATE
#primero defino nombre de la nueva columna = contenido columna
#en este caso sup_redondeado

b_v3 <- b_inmuebles %>% 
  mutate(sup_redondeado=round(superficie_aproximada_m2))

#veo que tengo una col mas que en al base original

#con funcion head veo las primeras col de la base de datos
head(b_v3)

#pero no veo la ultima columna, puedo usar SELECT
prueba <- b_v3 %>% select(superficie_aproximada_m2,sup_redondeado)
head(prueba)

# en vez de crear un objeto nuevo puedo poner directo
b_v3 %>% select(superficie_aproximada_m2,superClassDepth()) %>% 
  head

#con el signo - en vez de quedarse con la columna la puedo descartar
#junto todo lo que hice

b_definitivo <- b_inmuebles %>% 
  filter(pais=="Argentina") %>% 
 filter(-"Latitud") %>% 
  mutate(sup_redondeado=round(superficie_aproximada_m2),
         sup_rangos=case_when(sup_redondeado>=0&sup_redondeado <=400 
                              ~ "Entre 0, 400"))

#pasar un valor numerico a una categoria discreta
b_definitivo <- b_inmuebles %>% 
  filter(pais=="Argentina") %>% 
  mutate(sup_redondeado=round(superficie_aproximada_m2),
         sup_rangos=case_when(sup_redondeado>=0&sup_redondeado <=400 
                              ~ "Entre 0, 400",
                              sup_redondeado>=401 &sup_redondeado <=1000 
                               ~ "Entre 401 y 1000"))
table(b_definitivo$sup_rangos)

#tarea: hacer un fork de prueba_utdt, lo clonamos, 
#hacemos una carpeta con nuestro apellido
#guardamos el script
#hacemos un commit para pushear los cambios de nuestra version local y git
#luego pull request

#PREGUNTAS: SACAR UNA COL, VER VALORES IMPLICITOS/EXPLICITOS MISSING
#COMBINAR DOS VECTORES