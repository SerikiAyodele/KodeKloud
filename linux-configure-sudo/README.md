We have some users on all app servers in Stratos Datacenter. Some of them have been assigned some new roles and responsibilities, therefore their users need to be upgraded witH sudo access so that they can perform admin level tasks.

a. Provide sudo access to user ammar on all app servers.

b. Make sure you have set up password-less sudo for the user.

APP SERVER 1-3
==============

    1  usermod -aG wheel ammar                -ADD THE USER
    2  su - ammar                             -LOGIN AS THE USER
    3  sudo cat /etc/sudoers |grep ammar      -SEE IF YOU CAN LOGIN WITOUT PASSWORD
    4  ^C and logout                          -IF YOU CAN'T, EXIT AND LOGOUT
    5  visudo                                 -EDIT THE SUDOERS FILE
    `#   ALL=(ALL)   NOPASSWD:ALL`            -UNCOMMENT THIS LINE
    6  su - ammar                             -LOGIN AS THE USER
    7  sudo cat /etc/sudoers |grep ammar      -SEE IF YOU CAN LOGIN WITOUT PASSWORD
