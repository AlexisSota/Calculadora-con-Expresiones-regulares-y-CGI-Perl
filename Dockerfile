
FROM perl:5.36

RUN cpan install CGI

RUN mkdir -p /usr/src/app/html /usr/src/app/css /usr/src/app/cgi-bin

COPY ./html /usr/src/app/html
COPY ./css /usr/src/app/css
COPY ./cgi-bin /usr/src/app/cgi-bin

EXPOSE 80

RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-perl2 && \
    a2enmod cgi

COPY ./apache.conf /etc/apache2/sites-available/000-default.conf

CMD ["apachectl", "-D", "FOREGROUND"]
