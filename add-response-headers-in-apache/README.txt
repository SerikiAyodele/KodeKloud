
We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:

1. Install httpd package on App Server 3 using yum and configure it to run on 8089 port, make sure to start its service.

2. Create an index.html file under Apache's default document root i.e /var/www/html and add below given content in it.
   `Welcome to the xFusionCorp Industries!`

3. Configure Apache to enable below mentioned headers:
   X-XSS-Protection header with value 1; mode=block
   X-Frame-Options header with value SAMEORIGIN
   X-Content-Type-Options header with value nosniff

Note: You can test using curl on the given app server as LBR URL will not work for this task.

APP SERVER 3
============
    
    1  yum install httpd
    2  systemctl start apache
    3  systemctl status httpd
    4  vi /etc/httpd/conf/httpd.conf
       ![keys](img/1.png)
    5  vi /var/www/html/index.html
       ![keys](img/2.png)
    6  vi /etc/httpd/conf/httpd.conf
       ![keys](img/3.png)
    7  systemctl restart httpd
    8  systemctl status httpd
    9  curl http://localhost:8089        - SHOULD RETURN THE MESSAGE
    10 curl -i http://localhost:8089     - SHOULD RETURN OK STATUS
