#!/bin/bash
echo "Has seleccionado cambiar la IP"
read -p "Introduce la interfaz a usar: " interfaz
read -p "introduce la IP: " ip
read -p "Introduce la mascara: " mascara
ip a add $ip/$mascara dev $interfaz 2>/dev/null
if [ $? = 0 ]
then echo "Cambiado con exito"
else echo "Algo salió mal"
fi