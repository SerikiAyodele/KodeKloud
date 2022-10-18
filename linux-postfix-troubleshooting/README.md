# Linux PostFix TroubleShooting

1. Log into the server and as the root user 

![1](img/1.png)


2. Start the PostFix service and check for the status 

![2](img/2.png)


3. The error is caused by a wrong parameter declaration

![3](img/3.png)


4. To fix the error go into the file and comment out the inet_interfaces paarameter

![4](img/4.png)


5. Start the service again and check for the status

![5](img/5.png)
