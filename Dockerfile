FROM zgldh/docker-php-core

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# git
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils curl git unzip 

# Composer
RUN curl https://getcomposer.org/composer.phar > /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://packagist.laravel-china.org
RUN cp /root/.composer /.composer -r
RUN mkdir -p /.composer/cache/repo/https---packagist.laravel-china.org/
RUN chmod +rwx /.composer -R
