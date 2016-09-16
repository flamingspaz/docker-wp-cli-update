FROM php:7.1-fpm
RUN docker-php-ext-install -j$(nproc) mysqli
ADD custom.ini /usr/local/etc/php/conf.d/custom.ini
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /bin/wp
RUN chown www-data:www-data /bin/wp && chmod +x /bin/wp
USER www-data
CMD ["/bin/wp", "core", "update"]
