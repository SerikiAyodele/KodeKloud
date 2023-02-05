The backup server in the Stratos DC contains several template XML files used by the Nautilus application. 
However, these template XML files must be populated with valid data before they can be used.
 One of the daily tasks of a system admin working in the xFusionCorp industries is to apply string and file 
 manipulation commands!

Replace all occurances of the string About to Echo-Location on the XML file /root/nautilus.xml located in the backup server.


BACK UP SERVER 
===============
    1  cat /root/nautilus.xml  |grep About  | wc -l
        `66`
    2  cat /root/nautilus.xml  |grep About
        '''
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        <about>About</about>
        ...
        '''
    4  sed -i 's/About/Echo-Location/g' /root/nautilus.xml
    5  cat /root/nautilus.xml  |grep Echo-Location
        '''
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        <about>Echo-Location</about>
        ...
        '''

    7  cat /root/nautilus.xml  | grep Echo-Location |wc -l
        `66`
    8  cat /root/nautilus.xml  |grep About |wc -l
        `0`
  