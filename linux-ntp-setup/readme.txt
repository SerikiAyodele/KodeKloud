Install and configure NTP server on App Server 2.

Add NTP server 2.north-america.pool.ntp.org in NTP configuration on App Server 2.

APP SERVER 2
=============
   1  ssh steve@stapp02
   2  sudo su -
   3  yum install -y ntp  -- INSTALL THE NTP SERVER
   4  vi /etc/ntp.conf    -- ADD THE SERVER HERE

   git commit --date="2023-03-02" -m "New Commit"
