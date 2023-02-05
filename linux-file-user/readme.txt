There was some users data copied on Nautilus App Server 1 at /home/usersdata location by the Nautilus production support team in Stratos DC. Later they found that they mistakenly mixed up different user data there. Now they want to filter out some user data and copy it to another location. Find the details below:



On App Server 1 find all files (not directories) owned by user mariyam inside /home/usersdata directory and copy them all while keeping the folder structure (preserve the directories path) to /beta directory.

APP SERVER 1
=============
    1  ssh steve@stapp02
    2  sudo su -
    3  find /home/usersdata -user mariyam
    4  find /home/usersdata/ -type f -user mariyam -exec cp --parents {} /beta 
    8  ll /beta/home/usersdata