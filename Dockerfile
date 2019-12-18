FROM php:7.2 apache


# Note: mycrypt extension is not provided with the php source since 7.2.
#	Instead it is available through PECL.
#	To install a PECL extention in docker,
#	 use 'pecl install <packagename-version>' to download and compile it,
# 	then use 'docker-php-ext-enable' to enable it:

#	wordpress needs mod-rewrite enabled in apache, which is disabled in defaulat php:7 image.

RUN	    apt-get update \
	&&  apt-get install -y --no-install recommands \
	     libjpeg-dev \
	     libpng-deve \
	 &&  docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	 &&  docker-php-ext-install gd mysqli opcache \
	 &&  a2enmod rewrite expires \
	 &&  curl -# -LO https://wordpress.org/latest.tar.gz \
	 &&  tar xzf latest.tar.gz \
	 &&  mv wordpress/* /var/www/html/ \
	 &&  chown 33:33 /var/www/html -R
	 
	 
	 
	 
	 
	 ######################################################################################
# Optional:
Copy any custom apache configuraion / virtualhost configuration file at this point
# Put your apache config files in /etc/apache2/sites-enabled/
# Main httpd.conf file is located at: /usr/local/apache2/conf/httpd.conf
######################################################################################
