#!/bin/bash
set -e

mv /init/libmod_gzip.so /usr/lib/apache2/modules/
mv /init/gzip.* /etc/apache2/mods-available/
cd /etc/apache2/mods-available/
a2enmod gzip

exec "$@"