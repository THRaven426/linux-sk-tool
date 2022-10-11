#!/bin/bash
echo "Has seleccionado cambiar la IP"

read -p "Deseas configurar Estatica o DHCP (E/D)" ed
if [ $ed = 'd' ]||[ $ed = 'D' ]; then
    cp ../config/DHCP.yaml /etc/netplan/00-installer-config.yaml
    sudo netplan apply
elif [ $ed = 'e' ]||[ $ed = 'E' ]; then
    cp ../config/STATIC.yaml /etc/netplan/00-installer-config.yaml
    sudo nano /etc/netplan/00-installer-config.yaml
    sudo netplan apply
else
    echo "Algo salió mal"
fi
