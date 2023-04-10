The Nautilus DevOps team had a discussion about, how they can train different team members to use Ansible for different automation tasks. There are numerous ways to perform a particular task using Ansible, but we want to utilize each aspect that Ansible offers. The team wants to utilise Ansible's conditionals to perform the following task:

- An inventory file is already placed under /home/thor/ansible directory on jump host, with all the Stratos DC app servers included.
- Create a playbook /home/thor/ansible/playbook.yml and make sure to use Ansible's when conditionals statements to perform the below given tasks.

A) Copy blog.txt file present under /usr/src/devops directory on jump host to App Server 1 under /opt/devops directory. Its user and group owner must be user tony and its permissions must be 0655 .
B) Copy story.txt file present under /usr/src/devops directory on jump host to App Server 2 under /opt/devops directory. Its user and group owner must be user steve and its permissions must be 0655 .
C) Copy media.txt file present under /usr/src/devops directory on jump host to App Server 3 under /opt/devops directory. Its user and group owner must be user banner and its permissions must be 0655 .

NOTE: You can use ansible_nodename variable from gathered facts with when condition. Additionally, please make sure you are running the play for all hosts i.e use - hosts: all.
Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml, so please make sure the playbook works this way without passing any extra arguments.


JUMP HOST SERVER
================
    1. cd /home/thor/ansible/
    2. ansible all -a "ls -ltr /opt/dba" -i inventory                                     --CHECK IF ANSIBLE INVENTORY FILE WORKS PROPERLY
       ```
       stapp03 | FAILED | rc=2 >>
       ls: cannot access /opt/itadmin: No such file or directorynon-zero return code
       stapp01 | FAILED | rc=2 >>
       ls: cannot access /opt/itadmin: No such file or directorynon-zero return code
       stapp02 | FAILED | rc=2 >>
       ls: cannot access /opt/itadmin: No such file or directorynon-zero return code
       ```
    3. vi playbook.yml
    4. ansible-playbook -i inventory playbook.yml                                          --TO EXECUTE THE PLAYBOOK
    5. ansible all -a "ls -ltr /opt/dba" -i inventory
       ```
       stapp01 | CHANGED | rc=0 >>
       total 4
       -rwxr-xr-x 1 tony tony 35 Apr 10 12:23 blog.txt
       stapp02 | CHANGED | rc=0 >>
       total 4
       -rwxr-xr-x 1 steve steve 27 Apr 10 12:23 story.txt
       stapp03 | CHANGED | rc=0 >>
       total 4
       -rwxr-xr-x 1 banner banner 22 Apr 10 12:23 media.txt
       ```
