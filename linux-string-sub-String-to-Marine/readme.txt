The backup server in the Stratos DC contains several template XML files used by the Nautilus application. However, these template XML files must be populated with valid data before they can be used. One of the daily tasks of a system admin working in the xFusionCorp industries is to apply string and file manipulation commands!



Replace all occurances of the string String to Marine on the XML file /root/nautilus.xml located in the backup server.

BACK UP SERVER 
===============
    1 cat /root/nautilus.xml  |grep String  | wc -l
        `66`
    2 cat /root/nautilus.xml  |grep String
      ```
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      ```
    4  sed -i 's/String/Marine/g' /root/nautilus.xml
    5  cat /root/nautilus.xml  |grep Marine
       ```
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>
      <Marine>String</Marine>

    7  cat /root/nautilus.xml  | grep Marine |wc -l
        `66`
    8  cat /root/nautilus.xml  |grep String |wc -l
        `0`
        ```
