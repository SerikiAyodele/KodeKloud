There is a critical issue going on with the Nautilus application in Stratos DC. 
The production support team identified that the application is unable to connect
 to the database. After digging into the issue, the team found that mariadb service
  is down on the database server.

Look into the issue and fix the same.


DATABASE SERVER
===============
    1  ssh peter@stdb01                   --LOGIN
    2  systemctl status mariadb           -- CHECK THE DB STATUS
    3  systemctl start mariadb            -- START THE DB
    4  systemctl stop mariadb             -- STOP THE DB
    5  chown mysql:mysql /var/run/mariadb -- CHANGE OWNERSHIP SETTINGS TO MYSQL IN MARIADB FILE
    6  systemctl restart mysql            -- 
    7  systemctl restart mariadb          -- RESTART THE DB
    8  systemctl status mariadb           -- CHECK THE STATUS
    