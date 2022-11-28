The Nautilus devops team got some requirements related to some Apache config changes. 
They need to setup some redirects for some URLs. There might be some more changes need to be done. Below you can find more details regarding that:
httpd is already installed on app server 3. Configure Apache to listen on port 5004.

Configure Apache to add some redirects as mentioned below:

a.) Redirect http://stapp03.stratos.xfusioncorp.com:<Port>/ to http://www.stapp03.stratos.xfusioncorp.com:<Port>/ i.e non www to www. This must be a permanent redirect i.e 301
b.) Redirect http://www.stapp03.stratos.xfusioncorp.com:<Port>/blog/ to http://www.stapp03.stratos.xfusioncorp.com:<Port>/news/. This must be a temporary redirect i.e 302.

APP SERVER 3
============
   1  vi /etc/httpd/conf/httpd.conf
    ```
    Listen 8086

    <VirtualHost *:5004>
    ServerName http://stapp03.stratos.xfusioncorp.com:5004/
    Redirect 301 / http://www.stapp03.stratos.xfusioncorp.com:5004/
    </VirtualHost>

    <VirtualHost *:5004>
    ServerName http://www.stapp03.stratos.xfusioncorp.com:5004/blog/
    Redirect 302 /blog/ http://www.stapp03.stratos.xfusioncorp.com:5004/news/
    </VirtualHost>
    ```

   2  systemctl restart httpd
   3  systemctl status httpd


