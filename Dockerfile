FROM ubuntu:18.04
LABEL authors="Ahmad Aji Santoso"

RUN apt-get update -y && \
    ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

RUN apt-get install apache2 -y

RUN apt-get install php libapache2-mod-php  -y
    
RUN apt-get -y install graphviz aspell ghostscript clamav php7.2-pspell php7.2-curl php7.2-gd php7.2-intl \
    php7.2-mysql php7.2-xml php7.2-xmlrpc php7.2-ldap php7.2-zip php7.2-soap php7.2-mbstring

ADD moodle-latest-310.tgz /var/www/html/

RUN mkdir /var/www/html/moodledata

RUN chown -R www-data:www-data /var/www/html/moodle/ && \
    chmod -R 755 /var/www/html/moodle/ && \
    chown www-data /var/www/html/moodledata

COPY moodle.conf /etc/apache2/sites-available/

RUN a2enmod rewrite && \
    a2ensite moodle.conf && \
    a2dissite 000-default.conf

RUN service apache2 restart

EXPOSE 80

CMD ["apachectl","-D","FOREGROUND"]