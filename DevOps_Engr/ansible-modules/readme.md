The Nautilus DevOps team is working to test several Ansible modules on servers in Stratos DC. Recently they wanted to test the file creation on remote hosts using Ansible. Find below more details about the task:

a. Create an inventory file ~/playbook/inventory on jump host and add all app servers in it.
b. Create a playbook ~/playbook/playbook.yml to create a blank file /tmp/data.txt on all app servers.
c. The /tmp/data.txt file permission must be 0744.
d. The user/group owner of file /tmp/data.txt must be tony on app server 1, steve on app server 2 and banner on app server 3.

Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml, so please make sure the playbook works this way without passing any extra arguments.

JMP HOST SERVER 
===============
    1. vi playbook/inventory
       ```
       stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n  ansible_user=tony
       stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@  ansible_user=steve
       stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
       ```
    2. vi playbook/playbook.yml
       ```
       - name: Create file in appservers
       hosts: stapp01, stapp02, stapp03
       become: yes
       tasks:
        - name: Create the file and set properties
          file:
          path: /tmp/data.txt\
          owner: "{{ ansible_user }}"
          group: "{{ ansible_user }}"
          mode: "0744"

          state: touch
       ```
    3. ansible-playbook  -i inventory playbook.yml
      ```
      thor@jump_host ~/playbook$ ansible-playbook  -i inventory playbook.yml

      PLAY [Create file in appservers] ***********************************************

      TASK [Gathering Facts] *********************************************************
      ok: [stapp02]
      ok: [stapp03]
      ok: [stapp01]

      TASK [Create the file and set properties] **************************************
      changed: [stapp01]
      changed: [stapp02]
      changed: [stapp03]

      PLAY RECAP *********************************************************************
      stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
      stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
      stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
      ```
    4. ansible all -a "ls -lsd /tmp/data.txt" -i inventory
      ```
      thor@jump_host ~/playbook$ ansible all -a "ls -lsd /tmp/data.txt" -i inventory
      stapp03 | CHANGED | rc=0 >>
      0 -rwxr--r-- 1 banner banner 0 Apr 21 16:54 /tmp/data.txt
      stapp01 | CHANGED | rc=0 >>
      0 -rwxr--r-- 1 tony tony 0 Apr 21 16:54 /tmp/data.txt
      stapp02 | CHANGED | rc=0 >>
      0 -rwxr--r-- 1 steve steve 0 Apr 21 16:54 /tmp/data.txt
      ```