The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. 
They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

Install and configure nginx on App Server 3.

On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key.
 Move them to some appropriate location and deploy the same in Nginx.

Create an index.html file with content Welcome! under Nginx document root.

For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. 
For example curl -Ik https://<app-server-ip>/.

APP SERVER 3
=============
   1  yum install epel-release -y
   2  yum install nginx -y
   3  vi /etc/nginx/nginx.conf
      ```
      server {
        listen       80;
        listen       [::]:80;
        server_name  172.16.238.12;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
      }

      # Settings for a TLS enabled server.
         server {
            listen       443 ssl http2;
            listen       [::]:443 ssl http2;
            server_name  172.16.238.12;
            root         /usr/share/nginx/html;
            ssl_certificate "/etc/pki/CA/certs/nautilus.crt";
            ssl_certificate_key "/etc/pki/CA/private/nautilus.key";
            ssl_session_cache shared:SSL:1m;
            ssl_session_timeout  10m;
            ssl_ciphers HIGH:!aNULL:!MD5;
            ssl_prefer_server_ciphers on;

      #        # Load configuration files for the default server block.
            include /etc/nginx/default.d/*.conf;

            error_page 404 /404.html;
                  location = /40x.html {
            }

            error_page 500 502 503 504 /50x.html;
                  location = /50x.html {
            }
         }

      }
      ```
   4  cp /tmp/nautilus.crt /etc/pki/CA/certs/
   5  cp /tmp/nautilus.key /etc/pki/CA/private/
   6  ll /usr/share/nginx/html/
      `lrwxrwxrwx 1 root root   25 Jul 25 11:56 index.html -> ../../doc/HTML/index.html`
   7  rm /usr/share/nginx/html/index.html
      rm: remove symbolic link ‘/usr/share/nginx/html/index.html’? y
   8  cat /usr/share/nginx/html/index.html
      Welcome!
   9  systemctl start nginx
   10 systemctl status nginx
   11 curl -Ik https://stapp03                    --FROM JUMP HOST


