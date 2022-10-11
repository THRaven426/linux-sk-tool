#!/bin/bash
sleep 1
clear
echo "Almacenamiento principal del equipo:"
echo "Equipo => $(hostname)"
echo "$(date)"
echo "------------------------------------------------"
echo "Consumo de memoria"
echo "$(egrep --color 'Mem|Cache|Swap' /proc/meminfo)"
