
The Nautilus DevOps team is ready to launch a new application, which they will deploy on app servers in Stratos Datacenter. They are expecting significant traffic/usage of httpd on app servers after that. This will generate massive logs, creating huge log files. To utilise the storage efficiently, they need to compress the log files and need to rotate old logs. Check the requirements shared below:

a. In all app servers install httpd package.

b. Using logrotate configure httpd logs rotation to monthly and keep only 3 rotated logs.

(If by default log rotation is set, then please update configuration as needed)
 
APP SERVER 1-3 
==============
    1  yum install httpd
    2  vi /etc/logrotate.d/httpd
    3  add:
        ```
        monthly
        rotate 3
        ```
    4 systemctl start httpd
    5 systemctl status httpd