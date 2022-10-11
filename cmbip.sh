#!/bin/bash
echo "Has seleccionado cambiar la IP"
sudo su
read -p "Deseas configurar Estatica o DHCP (E/D)" ed
if [ $ed = 'd' ]||[ $ed = 'D' ]; then
    cp ./config/dhcp.conf /etc/netplan/01-installer-config.yaml
    sudo netplan apply
elif [ $ed = 'e' ]||[ $ed = 'E' ]; then
    cp ./config/static.conf /etc/netplan/01-network-manager-all.yaml
    sudo nano /etc/netplan/01-network-manager-all.yaml
    sudo netplan apply
else
    echo "Sintaxis equivocada"
fi
