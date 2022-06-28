#!/bin/bash 
#: Autor Daniel
#: Fecha 23 JUN 2022
#: Proposito: Contabilizar los casos diarios de covid del todo el pais por un mes, mostrar el acomulado del mes
#: Opciones: ingresar mes(00) año(0000) y archivo

_obtiene_campo(){
# Obtiene el número de columna de la fecha seleccionada, para poder filtrar la información, para este proceso 
# se realiza la transpuesta de la cabecera del archivo con las fechas, y se cuenta la posición en la que se encuentra 
# la fecha electa, es valor se ingresa en la función suma resultado
local FECHA=$1
head -n 1 Casos_Diarios_Municipio_Confirmados_20220621.csv | tr "," "\n" | nl | grep $FECHA | cut -f 1

}

_suma_resultado(){
# Con el valor de la columna de la fecha seleccionada, se realiza la suma de todos los valores para obtener el total de los casos confirmados diarios
local FECHA=$1
tail -n +2 Casos_Diarios_Municipio_Confirmados_20220621.csv | awk -v CP=$FECHA -F "," '{A += $CP}; END {print A}'

}

_obtener_fechas(){
# Obtiene una lista de fechas diarias con el formato dd-mm-aaaa del mes y año filtrado ingresado por el usuario, 
# el resultado de se ingresa a la función obtiene campo
MES=$1
ANIO=$2
head -n 1 Casos_Diarios_Municipio_Confirmados_20220621.csv | tr "," "\n" | grep ${MES}-${ANIO}
}

# Ciclo para obtener el numero total de casos diarios, con la lista generada de las fechas diarias del mes y año seleccionado
CASOS=0
FECHAS=$(_obtener_fechas $1 $2)
for FECHA in $FECHAS
    do
    echo -n "* Fecha es $FECHA y los casos positivos son: "
    _suma_resultado $(_obtiene_campo $FECHA);
    CASO=$(_suma_resultado $(_obtiene_campo $FECHA)); # Variable que guarda el valor de los casos totales diarios
    CASOS=$(( CASOS + CASO ))  # Variable que guarda la suma de los casos totales diarios para obtener el total del mes
done


echo "________________________________________________"
echo "=> Los casos acumulados del mes $1 son $CASOS <=" # Totales del mes
