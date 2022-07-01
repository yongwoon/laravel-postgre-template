FROM php:7.4.29-fpm

ENV TZ Asia/Tokyo
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8 
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME=/composer

COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libpq-dev libonig-dev git zip unzip && \
    apt-get clean && \
    rm -rf /var/cache/apt

# docker-php-ext-install
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis
RUN docker-php-ext-install redis pdo pdo_pgsql mbstring

# php.conf, php-fpm.conf
COPY ./conf/php/php.ini /usr/local/etc/php/php.ini
COPY ./conf/php/docker.conf /usr/local/etc/php-fpm.d/docker.conf
COPY . /app

WORKDIR /app

RUN /usr/bin/composer install

# change owner
RUN chown www-data:www-data -R ./
