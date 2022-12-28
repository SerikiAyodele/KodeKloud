xFusionCorp Industries has planned to set up a common email server in Stork DC. After several meetings and recommendations, they have decided to use postfix as their mail transfer agent and dovecot as an IMAP/POP3 server. We would like you to perform the following steps:

- Install and configure postfix on Stork DC mail server.
- Create an email account ammar@stratos.xfusioncorp.com identified by B4zNgHA7Ya.
- Set its mail directory to /home/ammar/Maildir.
- Install and configure dovecot on the same server.

MAIL SERVER
============
Log into the mail server
    1  rpm -qa |grep postfix
    2  rpm -qa |grep dovecot
    3  yum install postfix -y
    # configurations to be done in this file is not shown here
    4  vi /etc/postfix/main.cf 
    5  useradd anita
    6  passwd anita          
    7  systemctl start postfix
    8  systemctl status postfix
    9  yum install dovecot -y
    # configurations to be done in these files are not shown here
   10  vi /etc/dovecot/dovecot.conf       
   11  vi /etc/dovecot/conf.d/10-mail.conf
   12  vi /etc/dovecot/conf.d/10-auth.conf
   13  vi /etc/dovecot/conf.d/10-master.conf
   14  systemctl start dovecot
   15  systemctl status dovecot

