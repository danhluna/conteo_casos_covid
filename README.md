# Conteo casos covid

En script hace el conteo de los casos covid diarios totales en toda la República Mexicana,  muestra los casos diarios agrupados por mes,  y da el acumulado total en todo el mes

## procesa.sh

Para la entrada  de los datos al script  se coloca el número de mes que se desea consultar a dos dígitos,  el año a cuatro dígitos, (El archivo comienza a contabilizar desde marzo del 2020),  y el nombre del archivo

Los que funcionan para este scrip son tomados de la página [datos covid-19 conacyt](https://datos.covid-19.conacyt.mx/#DownZCSV) Casos diarios por Municipio

>`bash procesa.sh [mes] [año] [archivo]`
>
>`bash procesa.sh 02 2020 Casos_Diarios_Municipio_Confirmados_20220621.csv`

## procesa_con_archivo.sh

Para el script en este caso solo se coloca el número de mes a los dígitos y el número de año a cuatro dígitos,  se requiere utilizar el archivo de los casos covid, qué se encuentra en este repositorio

>`bash procesa_con_archivo.sh [mes] [año]`
>
>`bash procesa_con_archivo.sh 02 2020`

## procesaMes.sh

El script solo muestra el conteo total del mes de los casos de covid en todo el país, se realiza pruebas para ver el tiempo que tarda en procesar la información.

>`time bash procesa.sh [mes] [año] [archivo]`
>
>`time bash procesa.sh 02 2020 Casos_Diarios_Municipio_Confirmados_20220621.csv`

Obteniendo los siguientes resultados, donde se observa una mejora de ahorro de tiempo.

![Image](IMG/img.jpg)