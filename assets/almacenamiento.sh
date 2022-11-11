#!/bin/bash
function pause(){
   read -p "$*"
}
sleep 2
clear
echo "Almacenamiento principal del equipo:"
echo "Equipo => $(hostname)"
echo "$(date)"
echo "------------------------------------------------"
echo "Consumo de memoria"
echo "$(egrep --color 'Mem|Cache|Swap' /proc/meminfo)"
pause 'Pulsa [Enter] para salir...'
