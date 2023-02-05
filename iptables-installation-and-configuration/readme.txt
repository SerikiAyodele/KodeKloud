We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 8082 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:

- Install iptables and all its dependencies on each app host.
- Block incoming port 8082 on all apps for everyone except for LBR host.
- Make sure the rules remain, even after system reboot.


APP SERVER 1-3
===============
    1. yum install iptables-services -y
    2. systemctl start iptables
    3. systemctl enable iptables
    4. iptables -A INPUT -p tcp --destination-port 8082 -s 172.16.238.14 -j ACCEPT
    5. iptables -A INPUT -p tcp --destination-port 8082 -j DROP
    6. iptables -L --line-numbers
    7. iptables -R INPUT 5 -p icmp -j REJECT
    8. service iptables save 
    9. systemctl restart iptables && systemctl status iptables

LBR SERVER
===============
-   TO VALIDATE
    curl -I stapp01:8082
    curl -I stapp02:8082
    curl -I stapp03:8082