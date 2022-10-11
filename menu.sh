#!/bin/bash
sudo chmod -R +x ./assets/
submenuu() {
    local PS3='Seleccione una opcion: '
    local options=("Almacenamiento" "Actualizar equipo (Solo Administrador)" "Volver")
    local opt
    select opt in "${options[@]}"; do
        case $opt in
        "Almacenamiento")
            echo "Has elegido almacenamiento del sistema..."
            ./assets/almacenamiento.sh
            ;;
        "Actualizar equipo (Solo Administrador)")
            sudo ./assets/actualizar.sh
            ;;
        "Volver")
            return
            ;;
        *) echo "invalid option $REPLY" ;;
        esac
    done
}
submenud() {
    local PS3='Seleccione una opcion: '
    local options=("DHCP" "Cambiar IP" "Volver")
    local opt
    select opt in "${options[@]}"; do
        case $opt in
        "DHCP")
            sudo ./assets/dhcp.sh
            ;;
        "Cambiar IP")
            echo "Has elegido cambiar la IP..."
            sudo ./assets/cmbip.sh
            ;;
        "Volver")
            return
            ;;
        *) echo "invalid option $REPLY" ;;
        esac
    done
}

# menu
PS3='Selecciona una opcion: '
options=("Sistema" "Instalar Servicios" "Salir")
select opt in "${options[@]}"; do
    case $opt in
    "Sistema")
        submenuu
        ;;
    "Instalar Servicios")
        submenud
        ;;
    "Salir")
        exit
        ;;
    *) echo "Opcion $REPLY no es valida" ;;
    esac
done
