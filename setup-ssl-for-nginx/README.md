The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:



Install and configure nginx on App Server 3.

On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.

Create an index.html file with content Welcome! under Nginx document root.

For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.
 1  sudo yum install epel-release  
    2  sudo yum update  
    3  The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:
    4  Install and configure nginx on App Server 3.
    5  On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
    6  Create an index.html file with content Welcome! under Nginx document root.
    7  For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.
    8  The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:
    9  Install and configure nginx on App Server 3.
   10  On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
   11  Create an index.html file with content Welcome! under Nginx document root.
   12  For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.
   13  yum install nginx
   14  vi /etc/nginx/nginx.conf
   15  cp /tmp/nautilus.crt /etc/pki/CA/certs/
   16  cp /tmp/nautilus.key /etc/pki/CA/private/
   17  ll /usr/share/nginx/html/
   18  vi /usr/share/nginx/html/index.html
   19  chmod 777 /usr/share/nginx/html/index.html
   20  chmod 0400 /usr/share/nginx/html/index.html
   21  cd /usr/share/nginx/html
   22  sudo chmod 0400 index.html
   23  cat /usr/share/nginx/html/index.html
   24  cd ~
   25  cat /usr/share/nginx/html/index.html
   26  rm /usr/share/nginx/html/index.html
   27  vi /usr/share/nginx/html/index.html
   28  history
