FROM  centos:latest
LABEL kuber.io=foundation /
      openshift.io=ex299xam 
      MAINTAINER="REDHAT EXAMS"
RUN   yum install httpd -y &&  yum clean all &&  rm -Rf /tmp* &&  sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf 
COPY  src/  /var/www/html/
RUN chown apache:apache  /var/run/httpd  /var/log/httpd  
RUN chmod  -R 777  /var/run/httpd  /var/log/httpd 
EXPOSE 8080
USER 1000
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

