During a recent security audit, the application security team of xFusionCorp Industries found security issues with the Apache web server on Nautilus App Server 3 server in Stratos DC. They have listed several security issues that need to be fixed on this server. Please apply the security settings below:



a. On Nautilus App Server 3 it was identified that the Apache web server is exposing the version number. Ensure this server has the appropriate settings to hide the version number of the Apache web server.

b. There is a website hosted under /var/www/html/official on App Server 3. It was detected that the directory /official lists all of its contents while browsing the URL. Disable the directory browser listing in Apache config.

c. Also make sure to restart the Apache service after making the changes.

APP SERVER 3
=============
    1  vi /etc/httpd/conf/httpd.conf         -A
    2  systemctl restart httpd
    3  vi /etc/httpd/conf/httpd.conf         -B
    4  cd /var/www/html/official
    5  vi .htaccess
    6  cd ~
    7  systemctl restart httpd               -C
