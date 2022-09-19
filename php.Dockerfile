FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y git zip

RUN echo "session.save_path=\"/app/tmp\"" >> "$PHP_INI_DIR/php.ini"


RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN pecl install mongodb xdebug && docker-php-ext-enable mongodb xdebug

RUN pecl install redis xdebug && docker-php-ext-enable redis xdebug

COPY app /var/www/html

# Uncomment to have mysqli extension installed and enabled
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

#EXPOSE 9000
