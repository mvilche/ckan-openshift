#!/bin/sh
set -e

CKAN_ROOT=/opt/src/ckan
CKAN_DATADIR=/opt/src/ckan/data/.nodelete
CKAN_VERSION=ckan-2.8.2
CKAN_REPO=https://github.com/ckan/ckan.git


if [ -z "$TIMEZONE" ]; then
echo "···································································································"
echo "VARIABLE TIMEZONE NO SETEADA - INICIANDO CON VALORES POR DEFECTO"
echo "POSIBLES VALORES: America/Montevideo | America/El_Salvador"
echo "···································································································"
else
echo "···································································································"
echo "TIMEZONE SETEADO ENCONTRADO: " $TIMEZONE
echo "···································································································"
echo "SETENADO TIMEZONE"
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime && \
echo $TIMEZONE > /etc/timezone
fi



    if [ -z $POSTGRES_HOST ] || [ -z $POSTGRES_USER ] || [ -z $POSTGRES_PASSWORD ] || [ -z $POSTGRES_PORT ] || [ -z $CKAN_URL ] || [ -z $CKAN_REDIS_URL ] || [ -z $CKAN_SOLR_URL ] || [ -z $CKAN_DATAPUSHER_URL ]; then
    echo "***************************************************"
    echo "SE DETECTARON VARIABLES REQUERIDAS NO SETEADAS, VERIFICAR POSTGRES_USER, POSTGRES_ PASSWORD, POSTGRES_HOST, POSTGRES_PORT, CKAN_URL, CKAN_REDIS_URL, CKAN_SOLR_URL, CKAN_DATAPUSHER_URL"
    echo "*******************************************************"
    exit 1
    fi


if [ -d $CKAN_DATADIR ]; then
	echo "**********************************************"
    echo "CKAN YA FUE INICIALIZADO - SE ENCONTRARON DATOS"
    echo "**********************************************"
else

    echo "***************************************************"
    echo "CKAN NO SE HA INICIALIZADO"
    echo "EL TIEMPO DE LA INSTALACION SERA DE UNOS MINUTOS"
    echo "INICIALIZANDO..."
    echo "*******************************************************"

    paster db init -c /opt/src/ckan/config/production.ini && \
    echo "CREANDO USUARIO ADMIN" && \
    paster --plugin=ckan user add admin  email=admin@admin.com password=adminadmin --config=/opt/src/ckan/config/production.ini && \
    paster --plugin=ckan sysadmin add admin --config=/opt/src/ckan/config/production.ini  && \
echo "******************************************"

    echo "USUARIO ADMIN CREADO!"
    echo "Usuario: admin"
    echo "Password: adminadmin"
    echo "Email: admin@admin.com"
    echo "Rol: sysadmin"

echo "CAMBIE LA CONTRASENA AL INGRESAR AL SITIO!!!!!"

echo "********************************************"

    echo "*******************************************************" && \
	echo "CKAN $CKAN_VERSION INICIALIZADO CORRECTAMENTE" && \
    echo "*******************************************************"
	echo "TAREAS COMPLETADAS CORRECTAMENTE." && \
    echo "*******************************************************" && \
    mkdir -p /opt/src/ckan/data/.nodelete
fi



echo "INICIANDO CKAN...."
sleep 2s
exec paster serve "$@"
