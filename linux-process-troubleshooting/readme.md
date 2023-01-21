The production support team of xFusionCorp Industries has deployed some of the 
latest monitoring tools to keep an eye on every service, application, etc. 
running on the systems. One of the monitoring systems reported about Apache 
service unavailability on one of the app servers in Stratos DC.

Identify the faulty app host and fix the issue. Make sure Apache service is up 
and running on all app hosts. They might not hosted any code yet on these servers
 so you need not to worry about if Apache isn't serving any pages or not, just 
 make sure service is up and running. Also, make sure Apache is running on port 
 5000 on all app servers.


APP SERVER 1
==============
    1 telnet stapp01 5000              ---TO CHECK FOR FAULTY SERVER
      telnet stapp02 5000
      telnet stapp03 5000
    2 ssh tony@stapp01                 ---SSH INTO FAULTY SERVER
    3  systemctl start httpd           ---CHECK EXISTING APACHE HTTPD SERVICE
    4  systemctl status httpd
    ```
    Aug 13 15:02:27 stapp01.stratos.xfusioncorp.com httpd[692]: (98)Address already 
    in use: AH00072: make_sock: could not bind to address 0.0.0.0:5000
    ```
    5  netstat -tulnp                  ---CHECK WHAT SERVICE IS USING THE PORT AND THE PID
    ```
    [root@stapp01 ~]# netstat -tulnp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
    tcp        0      0 127.0.0.1:5000          0.0.0.0:*               LISTEN      498/sendmail: accep 
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      1/init              
    tcp        0      0 127.0.0.11:34675        0.0.0.0:*               LISTEN      -                   
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      414/sshd            
    tcp6       0      0 :::111                  :::*                    LISTEN      389/rpcbind         
    tcp6       0      0 :::22                   :::*                    LISTEN      414/sshd            
    udp        0      0 127.0.0.11:56862        0.0.0.0:*                           -                   
    udp        0      0 0.0.0.0:111             0.0.0.0:*                           1/init              
    udp        0      0 0.0.0.0:986             0.0.0.0:*                           389/rpcbind         
    udp6       0      0 :::111                  :::*                                389/rpcbind         
    udp6       0      0 :::986                  :::*                                389/rpcbind
    ```
    6  ps -ef  |grep sendmail            ---CONFIRM THE PID
    ```
    [root@stapp01 ~]# ps -ef  |grep sendmail
    root         498       1  0 18:20 ?        00:00:00 sendmail: accepting connections
    root         594     550  0 18:23 pts/0    00:00:00 grep --color=auto sendmail
    ```
    7  kill 498
    8  ps -ef  |grep sendmail
    ```
    [root@stapp01 ~]# ps -ef  |grep sendmail
    root         596     550  0 18:23 pts/0    00:00:00 grep --color=auto sendmail
    ```
    9  systemctl start httpd
    10 systemctl status  httpd
    11 telnet stapp01 5000              ---TO CHECK WE CAN ACCESS THE PORT NOW 