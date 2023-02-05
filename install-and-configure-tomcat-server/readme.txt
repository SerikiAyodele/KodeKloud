The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:

a. Install tomcat server on App Server 2 using yum.
b. Configure it to run on port 6300.
c. There is a ROOT.war file on Jump host at location /tmp. Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e without specifying any sub-directory anything like this http://URL/ROOT 

APP SERVER 2
=============
    1  cp /tmp/ROOT.war /usr/share/tomcat/webapps
    2  ssh steve@stapp02
    3  ll /usr/share/tomcat/webapps/
    4  systemctl start tomcat
    5  systemctl status tomcat
    6  curl -i http://stapp02:6300