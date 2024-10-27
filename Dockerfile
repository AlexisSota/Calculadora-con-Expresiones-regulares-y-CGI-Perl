FROM perl:5.34

# Instala Apache y el módulo CGI
RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-perl2 && \
    a2enmod cgi

# Copia archivos necesarios
COPY cgi-bin/calculadora.pl /usr/lib/cgi-bin/
COPY css/style.css /var/www/html/css/

# Configura permisos y Apache
RUN chmod +x /usr/lib/cgi-bin/calculadora.pl

# Expone el puerto 80
EXPOSE 80

# Ejecuta Apache
CMD ["apachectl", "-D", "FOREGROUND"]
