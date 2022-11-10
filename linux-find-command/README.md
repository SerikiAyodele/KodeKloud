During a routine security audit, the team identified an issue on the Nautilus App Server. Some malicious content was identified within the website code. After digging into the issue they found that there might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:



a. On App Server 2 at location /var/www/html/ecommerce find out all files (not directories) having .js extension.

b. Copy all those files along with their parent directory structure to location /ecommerce on same server.

c. Please make sure not to copy the entire /var/www/html/ecommerce directory content.

APP SERVER 2
============
    1  ssh steve@stapp02
    2  sudo su -
    3  find /var/www/html/ecommerce -name '*.js' -exec cp --parents {} /ecommerce \;
    4  ll /ecommerce
The Nautilus production support team and security team had a meeting last month in which they decided to use local yum repositories for maintaing packages needed for their servers. For now they have decided to configure a local yum repo on Nautilus Backup Server. This is one of the pending items from last month, so please configure a local yum repository on Nautilus Backup Server as per details given below.



a. We have some packages already present at location /packages/downloaded_rpms/ on Nautilus Backup Server.

b. Create a yum repo named local_yum and make sure to set Repository ID to local_yum. Configure it to use package's location /packages/downloaded_rpms/.

c. Install package wget from this newly created repo.

DB SERVER
==========
    1  yum repolist
    2  vi /etc/yum.repos.d/local_yum.repo                -B
    3  cat /etc/yum.repos.d/local_yum.repo
    4  yum repolist
    5  yum install wget                                  -C
