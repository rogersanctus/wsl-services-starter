MARIADB_S=$(service --status-all 2>&1 | grep mysql | grep + 1>/dev/null && echo active)
PHP_FPM_S=$(service --status-all 2>&1 | grep php7.4-fpm | grep + 1>/dev/null && echo active)
NGINX_S=$(service --status-all 2>&1 | grep nginx | grep + 1>/dev/null && echo active)
REDIS_S=$(service --status-all 2>&1 | grep redis-server | grep + 1>/dev/null && echo active)

if [ "$APACHE2_S" != "active" ]; then
  service apache2 start
fi

if [ "$POSTGRES_S" != "active" ]; then
  service postgresql start
fi

if [ "$MARIADB_S" != "active" ]; then
  service mysql start
fi

if [ "$PHP_FPM_S" != "active" ]; then
  service php7.4-fpm start
fi

if [ "$NGINX_S" != "active" ]; then
  service nginx start
fi

if [ "$REDIS_S" != "active" ]; then
  service redis-server start
fi
