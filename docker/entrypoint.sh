#!/bin/bash
set -e

mv /init/libmod_server.so /usr/lib/apache2/modules/
mv /init/server.* /etc/apache2/mods-available/
cd /etc/apache2/mods-available/
a2enmod server

exec "$@"