## Create A User

For security reasons the xFusionCorp Industries security team has decided to use custom Apache users for each web application hosted, rather than its default user. This will be the Apache user, so it shouldn't use the default home directory. Create the user as per requirements given below:

a. Create a user named jim on the App server 1 in Stratos Datacenter.
b. Set its UID to 1553 and home directory to /var/www/jim.

APP SERVER 1
=============
    1  adduser jim
    2  `[root@stapp01 ~]# id jim
        uid=1002(jim) gid=1002(jim) groups=1002(jim)`
    3  usermod -d /var/www/jim jim
    4  `[root@stapp01 ~]# grep jim /etc/passwd
        jim:x:1002:1002::/var/www/jim:/bin/bash`
    5  usermod -u 1553 jim
    7  `[root@stapp01 ~]# id jim
        uid=1553(jim) gid=1002(jim) groups=1002(jim)`
