FROM wordpress:6.7.2-php8.1-apache

# Install LDAP PHP extension
RUN apt-get update && apt-get install -y \
    libldap2-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap

# Enable LDAP extension
RUN echo "extension=ldap.so" > /usr/local/etc/php/conf.d/ldap.ini