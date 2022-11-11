#!/bin/bash
submenuu() {
    while :; do
        #Menu
        clear
        echo -e "\e[1;32m"
        echo "1. Mostrar almacenamiento"
        echo "2. Actualizar equipo"
        echo "3. Cambiar IP"
        echo "4. Salir"
        echo ""
        #Escoger menu
        echo -n "Escoger opcion: "
        read opcion
        #Seleccion de menu
        case $opcion in
        1)
            echo "Mostrando almacenamiento"
            ./assets/almacenamiento.sh
            ;;
        2)
            echo "Actualizando equipo"
            sudo ./assets/actualizar.sh
            ;;
        3)
            echo "Cambiando IP"
            sudo ./assets/cmbip.sh
            ;;
        4) return 0 ;;
        #Alerta
        *)
            echo "Opcion invalida..."
            sleep 1
            ;;
        esac
    done
}

submenud() {
    while :; do
        #Menu
        clear
        echo -e "\e[1;32m"
        echo "1. Instalar DHCP"
        echo "2. Salir"
        echo ""
        #Escoger menu
        echo -n "Escoger opcion: "
        read opcion
        #Seleccion de menu
        case $opcion in
        1)
            echo "Instalando DHCP"
            sudo ./assets/dhcp.sh
            ;;
        2) return 0 ;;
        #Alerta
        *)
            echo "Opcion invalida..."
            sleep 1
            ;;
        esac
    done
}

# menu
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Opciones de sistema"
    echo "2. Instalar servicios"
    echo "3. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        submenuu
        ;;
    2)
        submenud
        ;;
    3) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
