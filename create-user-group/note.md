There are specific access levels for users defined by the xFusionCorp Industries system admin team. Rather than providing access levels to every individual user, the team has decided to create groups with required access levels and add users to that groups as needed. See the following requirements:

a. Create a group named nautilus_sftp_users in all App servers in Stratos Datacenter.
b. Add the user sonya to nautilus_sftp_users group in all App servers. (create the user if doesn't exist).

APP SERVER 1-3
==============
    1. groupadd nautilus_sftp_users
    2. adduser sonya
    3. usermod -a -G nautilus_sftp_users sonya
