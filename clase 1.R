#Este paquete traduce lenguaje de R a git
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
#library 

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
###LISTADO DE ATAJOS ALTL+SHIFT+K
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


