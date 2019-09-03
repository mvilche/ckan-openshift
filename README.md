# CKAN Source Docker images

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


# Funcionalidades:

  - Permite definir la zona horaria al iniciar el servicio
  - Permite definir el id del usuario que iniciará el contenedor
  - Non-root
  - Openshift compatible

### Iniciar


Ejecutar para iniciar el servicio

```sh
docker-compose up
```

### Persistencia de datos


| Directorio | Detalle |
| ------ | ------ |
| /opt/app | Directorio raiz |


### Variables


| Variable | Detalle |
| ------ | ------ |
| TIMEZONE | Define la zona horaria a utilizar (America/Montevideo, America/El_salvador) |
| GROUP_ID | Define id del grupo que iniciará el servicio (Ej: 1001) |
| USER_ID | Define id del grupo que iniciará el servicio (Ej: 1002) |
| POSTGRES_HOST | Ip o nombre del servidor postgres |
| POSTGRES_USER | Usuario servidor postgres |
| POSTGRES_PASSWORD | Contraseña servidor postgres |
| POSTGRES_PORT | Puerto servidor postgres |
| PULL_NEW_CHANGES | Realiza un pull al repositorio oficial de odoo previo al inciiar (true or false) |
| CKAN_URL | Ckan host url |
| CKAN_REDIS_URL | Redis host url |
| CKAN_SOLR_URL | Solr host url |
| CKAN_DATAPUSHER_URL | Datapusher host url |


License
----

Martin vilche
