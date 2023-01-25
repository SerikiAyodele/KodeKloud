The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named media_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3)

a. Create a zip archive named xfusioncorp_media.zip of /var/www/html/media directory.
b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.
c. Copy the created archive to Nautilus Backup Server server in /backup/ location.
d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

APP SERVER 3
==============
   1  cd /scripts
   2  vi media_backup.sh
   3  ssh-keygen -t rsa
   4  ssh-copy-id clint@stbkp01
   5  ssh clint@stbkp01
   6  logout
   7  sh media_backup.sh
   8  ll /backup
   9  ssh clint@stbkp01
   10 ll /backup



