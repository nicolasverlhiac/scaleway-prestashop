## -*- docker-image-name: "scaleway/wordpress:trusty" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Install packages
RUN apt-get -q update     \
 && apt-get -q -y upgrade \
 && apt-get install -y -q \
      apache2             \
      php5                \
      php5-cli            \
      php5-mcrypt         \
      php5-memcache       \
      php5-mysql          \
      php5-gd             \
      pwgen               \
 && apt-get clean


ENV PRESTASHOP_VERSION 1.6.1.3

# Patch rootfs
ADD ./patches/etc/ /etc/
ADD ./patches/usr/local/ /usr/local/

# Install Prestashop
RUN wget -qO prestashop.tar.gz https://github.com/PrestaShop/PrestaShop/archive/$PRESTASHOP_VERSION.tar.gz \
 && rm -rf /var/www/html/* \
 && tar -xzf prestashop.tar.gz -C /tmp/ \
 && mv /tmp/PrestaShop-$PRESTASHOP_VERSION/* /var/www/html \
 && rm -fr /tmp/PrestaShop-$PRESTASHOP_VERSION

# Change permissions
RUN chown -R www-data:www-data /var/www/html

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
