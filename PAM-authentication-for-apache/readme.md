We have a requirement where we want to password protect a directory in the Apache web server document root. We want to password protect http://<website-url>:<apache_port>/protected URL as per the following requirements (you can use any website-url for it like localhost since there are no such specific requirements as of now). Setup the same on App server 1 as per below mentioned requirements:

a. We want to use basic authentication.
b. We do not want to use htpasswd file based authentication. Instead, we want to use PAM authentication, i.e Basic Auth + PAM so that we can authenticate with a Linux user.
c. We already have a user mariyam with password BruCStnMT5 which you need to provide access to.
d. You can access the website using APP button on the top bar.

APP SERVER 1
============
   1   yum --enablerepo=epel -y install mod_authnz_external pwauth 
   2  vi /etc/httpd/conf.d/authnz_external.conf
   3  mkdir -p /var/www/html/protected
   4  cat /var/www/html/protected/index.html
   45  systemctl start httpd
   6  curl -u mariyam:BruCStnMT5 http://localhost:8080/protected/
    `This is KodeKloud Protected Directory`