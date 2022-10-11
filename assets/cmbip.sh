#!/bin/bash
echo "Has seleccionado cambiar la IP"
read -p "Deseas configurar Estatica o DHCP (E/D)" ed
if [ $ed = 'd' ] || [ $ed = 'D' ]; then
    cp ./config/dhcp.conf /etc/netplan/01-installer-config.yaml /etc/dhcp/ 2>/dev/null
    if [ $? = 0 ]; then
        echo "Configurado con exito"
        else
       echo "Algo no salio como se esperaba"
       
    fi
    sudo netplan apply
    sudo nano /etc/netplan/01-network-manager-all.yaml
elif [ $ed = 'e' ] || [ $ed = 'E' ]; then
    cp ./config/static.conf /etc/netplan/01-network-manager-all.yaml 2>/dev/null
    if [ $? = 0 ]; then
        echo "Configurado con exito"
        else
       echo "Algo no salio como se esperaba"
       
    fi
    sudo netplan apply
    sudo nano /etc/netplan/01-network-manager-all.yaml
else
    echo "Sintaxis equivocada"
fi
