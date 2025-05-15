Dockerfile 

FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    build-essential libpng-dev libjpeg-dev libonig-dev livxml2-dev \ zip unzip git curl
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .
RUN composer install

EXPOSE 9000

CMD ["php-fpm"]
