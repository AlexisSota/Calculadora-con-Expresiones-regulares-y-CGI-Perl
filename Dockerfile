FROM perl:5.34

RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-perl2 && \
    a2enmod cgi

# Cambia esto para copiar los archivos HTML directamente
COPY index.html /var/www/html/
COPY calculadora.html /var/www/html/
COPY ./cgi-bin /var/www/html/cgi-bin
COPY ./css /var/www/html/css
COPY ./js /var/www/html/js

RUN chmod +x /var/www/html/cgi-bin/calculadora.pl

COPY apache.conf /etc/apache2/sites-available/calculadora.conf
RUN a2ensite calculadora.conf

CMD ["apachectl", "-D", "FOREGROUND"]
