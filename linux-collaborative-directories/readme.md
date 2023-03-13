The Nautilus team doesn't want its data to be accessed any of the other groups/teams due to security 
reasons and want their data to be strictly accessed by the sysadmin group of the team.

Setup a collaborative directory /sysadmin/data on Nautilus App 3 server in Stratos Datacenter.

The directory should be group owned by the group sysadmin and the group should own the files inside
the directory. The directory should be read/write/execute to the group owners, and others should not have any access.
    
APP SERVER 3
==============    
    1  mkdir -p /sysadmin/data
    2  chown -R :sysadmin /sysadmin/data
    3  chmod -R 2770 /sysadmin/data
    4  ll -all /sysadmin/data
       ```
       [root@stapp03 ~]# ll -all /sysadmin/data
       total 8
       drwxrws--- 2  770 sysadmin 4096 Mar 13 18:46 .
       ```


