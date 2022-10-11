#!/bin/bash

read -p "Se va a instalar el servicio dhcp. ¿Esta seguro? (S/n)" sn
if [ $sn = 's' ]||[ $sn = 'S' ]; then
	sudo apt install isc-dhcp-server 2>/dev/null
if [ $? = 0 ]
then echo "Instalado con exito"
else echo "Algo salió mal"
fi
else
	echo "Cancelando..."
	sleep 1
	return
fi

read -p "¿Quieres descargar el archivo previamente configurado? (S/n)" sn
if [ $sn = 's' ]||[ $sn = 'S' ]; then
	wget https://github.com/Harrytx426/linux-sk-tool/blob/main/config/dhcpd.conf -P /etc/dhcp/ 2>/dev/null
	if [ $? = 0 ]; then
		echo "Descargado con exito"
	else
		echo "Algo salió mal"
	fi

else
	echo "Saltando paso..."
fi
read -p "¿Quieres cambiar la interfaz? (S/n): " sn
case $sn in
[sS])
	read -p "Quiere ver las interfaces del equipo? (S/n) " sn
	if [ $sn = 's' ]||[ $sn = 'S' ]; then
		ip addr list
	else
		echo "Saltando paso..."
	fi
	read -p "Cual es la interfaz que vas a utilizar? " intf
	sed -i "s/INTERFACESv4=.*/INTERFACESv4="\"${intf}"\"/g" /etc/default/isc-dhcp-server
	;;
[nN])
	echo "Saltando paso..."
	;;

esac
echo "Deberas cambiar la IP del dispositivo y reiniciar el servicio"
read -p "¿Quieres cambiar la IP del dispositivo ahora? (S/n) " sn
if [ $sn = 's' ]||[ $sn = 'S' ]; then
	sudo ./cmbip.sh 2>/dev/null
	if [ $? = 0 ]; then
		echo "Leyendo ejecutable..."
	else
		echo "No tienes permisos de ejecucion"
	fi

else
	echo "Saltando paso..."
fi
echo "Finalizando."
