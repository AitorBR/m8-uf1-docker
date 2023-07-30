#!/bin/bash
# Iniciem el servei mysql
/etc/init.d/mysql start
# Emmagatzemem en variables les dades de la BDs
DB_ROOT="root" DB_ROOT_PASS="root" DB_NAME="wordpress" DB_USER="wordpress" DB_PASS="wordpress"
# Ens connectem a la BD's com a root i creem l'usuari sql
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER '${DB_USER}';"
# Creem la BDs
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE ${DB_NAME};"
# Donem permisos a l'usuari sobre la BD's i li posem la contrasenya
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "GRANT ALL ON ${DB_NAME}.* TO $ {DB_USER} $"
# Reiniciem serveis
/etc/init.d/apache2 start
/bin/bash