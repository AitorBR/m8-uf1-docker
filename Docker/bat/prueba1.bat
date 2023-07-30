{\rtf1}
RUN apt-get update && apt-get install -y \ 
    bzr \
    cvs \
    git \
    mercurial \
    apt-get clean 



FROM debian
MAINTAINER M08 <m08@domini.cat>
ENV HOME /root
RUN apt-get update
RUN apt-get install -y nano wget curl unzip lynx apache2 php5 libapache2mod-php5 php5-mysql
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root-password-again password root" | defconf-set-selections
RUN apt-get install -y mysql-server
ADD https://es.wordpress.org/wordpress-4.2.2-es_ES.zip /var/www/wordpres.zip
ENV HOME /var/www/html/
RUN rm /var/www/html/index.html
RUN unzip /var/www.wordpress.zip -d /var/www/
RUN cp -r /var/www/wordrpess/* /var/www/html/
RUN chowm -R www-data:www-data /var/www/html/
RUN rm /var/www/wordpress.zip
ADD /script.sh /script.sh RUN ./script.sh
EXPOSE 80
CMD ["/bin/bash"]
ENTRYPOINT ["./script.sh"]







