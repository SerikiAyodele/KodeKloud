    We have some users on all app servers in Stratos Datacenter. Some of them have been assigned some new roles and responsibilities, therefore their users need to be upgraded with sudo access so that they can perform admin level tasks.



a. Provide sudo access to user ammar on all app servers.

b. Make sure you have set up password-less sudo for the user.

    1  usermod -aG wheel ammar
    2  chmod 777 /etc/sudoers
    3  ls -lh /etc/sudoers
    4  vi /etc/sudoers
