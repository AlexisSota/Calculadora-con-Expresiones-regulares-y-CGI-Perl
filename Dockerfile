
FROM perl:5.32-apache

RUN apt-get update && apt-get install -y libapache2-mod-perl2 && \
    a2enmod cgi

COPY . /var/www/html/

RUN chmod +x /var/www/html/cgi-bin/calculadora.pl

EXPOSE 80
