The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

a. Install cronie package on all Nautilus app servers and start crond service.

b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

APP SERVER 1-3
==============
    1  ssh <server>
    2  sudo su -
    3  yum install cronie
    4  systemctl start crond
    5  systemctl status crond
    6  crontab -u root -e
    7  ll /tmp/
