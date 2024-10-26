# Usar una imagen base de Debian
FROM debian:bullseye

# Instalar Perl, Apache y el módulo CGI
RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-perl2 perl && \
    a2enmod cgi && \
    rm -rf /var/lib/apt/lists/*

# Establecer la carpeta de trabajo
WORKDIR /var/www/html

# Copiar los archivos del proyecto al contenedor
COPY . .

# Establecer permisos para el archivo Perl
RUN chmod +x cgi-bin/calculadora.pl

# Configurar Apache para que sirva contenido CGI
RUN echo "AddHandler cgi-script .pl" >> /etc/apache2/apache2.conf

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache en modo en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
