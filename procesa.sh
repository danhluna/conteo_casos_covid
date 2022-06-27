#!/bin/bash 
#: Autor Daniel
#: Fecha 23 JUN 2022
#: Proposito: Contabilizar los casos diarios de covid del todo el pais por un mes, mostrar el acomulado del mes
#: Opciones: ingresar mes(00) año(0000) y archivo

_obtiene_campo(){

local FECHA=$1
head -n 1 Casos_Diarios_Municipio_Confirmados_20220621.csv | tr "," "\n" | nl | grep $FECHA | cut -f 1

#head -n 1 Casos_Diarios_Municipio_Confirmados_20220621.csv | tr "," "\n" | nl | grep $FECHA | awk '{print $1}'
# awk -F, ' NR == 1 {for(i = 1 ; i <= NF ; i++) if ($i == "22-05-2022") print i  }' Casos_Diarios_Municipio_Confirmados_20220621.csv 
}

_suma_resultado(){
local FECHA=$1
tail -n +2 Casos_Diarios_Municipio_Confirmados_20220621.csv | awk -v CP=$FECHA -F "," '{A += $CP}; END {print A}'

}

_obtener_fechas(){
MES=$1
ANIO=$2
head -n 1 Casos_Diarios_Municipio_Confirmados_20220621.csv | tr "," "\n" | grep ${MES}-${ANIO}
}

CASOS=0
FECHAS=$(_obtener_fechas $1 $2)
for FECHA in $FECHAS
    do
    echo -n "* Fecha es $FECHA y los casos positivos son: "
    _suma_resultado $(_obtiene_campo $FECHA);
    CASO=$(_suma_resultado $(_obtiene_campo $FECHA));
    CASOS=$(( CASOS + CASO ))
done
#ARCHIVO=$1
echo "________________________________________________"
echo "=> Los casos acumulados del mes $1 son $CASOS <="
#_suma_resultado $FECHA
#_suma_resultado $(_obtiene_campo $1) 
#echo $*

