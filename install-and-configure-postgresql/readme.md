The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:

a. Install and configure PostgreSQL database on Nautilus database server.
b. Create a database user kodekloud_aim and set its password to YchZHRcLkL.
c. Create a database kodekloud_db1 and grant full permissions to user kodekloud_aim on this database.
d. Make appropriate settings to allow all local clients (local socket connections) to connect to the kodekloud_db1 database through kodekloud_aim user using md5 method (Please do not try to encrypt password with md5sum).
e. At the end its good to test the db connection using these new credentials from root user or server's sudo user.

DB SERVER
=========
    1  yum -y install postgresql-server postgresql-contrib
    2  postgres=# create user kodekloud_aim with encrypted password 'YchZHRcLkL';
    3  postgresql-setup initdb
    4  systemctl enable postgresql
    5  systemctl start postgresql
    6  systemctl status postgresql
    7  sudo -u postgres psql
        ```
        postgres=# CREATE USER kodekloud_top WITH PASSWORD 'TmPcZjtRQx';
        CREATE ROLE

        postgres=# CREATE DATABASE kodekloud_db7;
        CREATE DATABASE

        postgres=# GRANT ALL PRIVILEGES ON DATABASE "kodekloud_db7" to kodekloud_top;
        GRANT

        postgres=# \q
        ```
    8  vi /var/lib/pgsql/data/postgresql.conf
       `listen_addresses = 'localhost'          # what IP address(es) to listen on;`
   10  vi /var/lib/pgsql/data/pg_hba.conf                                               ---CONFIGURE MD5
        ```
        local   all             all                                     md5

        host    all             all             127.0.0.1/32            md5

        host    all             all             ::1/128                 md5
        ```
   11  systemctl restart postgresql
   12  systemctl status postgresql

   **VALIDATE TASK**
        ```

        root@stdb01 ~]# psql -U kodekloud_aim -d kodekloud_db1 -h 127.0.0.1 -W
        Password for user kodekloud_top:
        psql (9.2.24)
        Type "help" for help.

        kodekloud_db7=> \q

        [root@stdb01 ~]# psql -U kodekloud_aim -d kodekloud_db1 -h localhost -W
        Password for user kodekloud_top:
        psql (9.2.24)
        ```
