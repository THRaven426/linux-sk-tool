#!/bin/bash
apt-get update

apt-get upgrade
if [ $? -ne 0 ]; then
    echo "EL SISTEMA NO SE ACTUALIZO CORRECTAMENTE "
else
    apt-get autoclean
    apt-get clean
    apt-get autoremove
    echo "El sistema se ha actualizado correctamente y se han eliminado los archivos residuales. "
fi
