Some of the developers from Nautilus project team have asked for SFTP access 
to at least one of the app server in Stratos DC. After going through the requirements, 
the system admins team has decided to configure the SFTP server on App Server 
2 server in Stratos Datacenter. Please configure it as per the following instructions:

a. Create an SFTP user anita and set its password to GyQkFRVNr3.
b. Password authentication should be enabled for this user.
c. Set its ChrootDirectory to /var/www/web.
d. SFTP user should only be allowed to make SFTP connections.

APP SERVER 2
=============
    1  useradd anita
    2  passwd anita
    3  mkdir -p /var/www/web
    4  ll -lsd /var/www/web
    5  chown root:root  /var/www
    6  chmod -R 755 /var/www
    7  ll -lsd /var/www/
    8  vi /etc/ssh/sshd_config
    9  systemctl restart sshd
   10  systemctl status sshd


