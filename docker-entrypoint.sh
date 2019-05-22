#!/bin/bash

echo "Edit ownership for /var/www/html"
chown -R www-data:www-data /var/www/html &

echo "Self check and upgrade"
cd /var/www/html
./bin/gpm version -f
./bin/gpm selfupgrade --no-interaction -vv
./bin/gpm install admin --no-interaction -vv

chown -R www-data:www-data /var/www/html &
chmod -R 777 /var/html/cache/

exec apache2-foreground