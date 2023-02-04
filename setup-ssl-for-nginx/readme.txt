The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

Install and configure nginx on App Server 3.

On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.

Create an index.html file with content Welcome! under Nginx document root.

For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.

APP SERVER 3
=============
   1  yum install nginx
   2  vi /etc/nginx/nginx.conf
   3  cp /tmp/nautilus.crt /etc/pki/CA/certs/
   4  cp /tmp/nautilus.key /etc/pki/CA/private/
   5  ll /usr/share/nginx/html/
   6  vi /usr/share/nginx/html/index.html
   7  chmod 777 /usr/share/nginx/html/index.html
   8  chmod 0400 /usr/share/nginx/html/index.html
   9  cd /usr/share/nginx/html
   10  sudo chmod 0400 index.html
   11  cd ~
   12  cat /usr/share/nginx/html/index.html

