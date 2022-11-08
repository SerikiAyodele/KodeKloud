During a routine security audit, the team identified an issue on the Nautilus App Server. Some malicious content was identified within the website code. After digging into the issue they found that there might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:



a. On App Server 2 at location /var/www/html/ecommerce find out all files (not directories) having .js extension.

b. Copy all those files along with their parent directory structure to location /ecommerce on same server.

c. Please make sure not to copy the entire /var/www/html/ecommerce directory content.

APP SERVER 2
============
    1  ssh steve@stapp02
    2  sudo su -
    3  find /var/www/html/ecommerce -name '*.js' -exec cp --parents {} /ecommerce \;
    4  ll /ecommerce
