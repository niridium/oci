#!/bin/sh

# Arranca mariadb daemon en background
mariadbd-safe &

# Espera a que se inicie mariadb
while ! mariadb-admin ping --silent 2>/dev/null; do
    sleep 1
done

# Da acceso a todas las bases de datos desde cualquier host al usuario "mysql"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%' IDENTIFIED BY 'secret' WITH GRANT OPTION;"

# Detiene el proceso mariadbd-safe en background
mariadb-admin shutdown
wait

# Ejecuta el servidor en foreground, necesario para que el contenedor arranque
mariadbd-safe
