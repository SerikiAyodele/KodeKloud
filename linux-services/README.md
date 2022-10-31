As per details shared by the development team, the new application release has some dependencies on the back end. There are some packages/services that need to be installed on all app servers under Stratos Datacenter. As per requirements please perform the following steps:



a. Install nscd package on all the application servers.

b. Once installed, make sure it is enabled to start during boot.

APP SERVER 1-3
===============
    1  ssh <server name>
    2  sudo su -
    3  yum install nscd -y
    4  systemctl start nscd
    5  systemctl enable nscd
    6  systemctl status nscd
