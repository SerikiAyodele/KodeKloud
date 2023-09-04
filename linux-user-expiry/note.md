> A developer named javed has been assigned Nautilus project temporarily as a backup resource. As a temporary resource for this project, we need a temporary user for javed. It’s a good idea to create a user with an expiration date so that the user won't be able to access servers beyond that point.

Therefore, create a user named javed on the App Server 2 in Stratos Datacenter. Set expiry date to 2021-01-28. Make sure the user is created as per standard and is in lowercase.


APP SERVER 2
=============
    1. sudo useradd javed 
    2. sudo chage -E 2021-01-28 javed
    3. sudo chage -l javed
        ```
        Last password change                                    : Sep 04, 2023
        Password expires                                        : never
        Password inactive                                       : never
        Account expires                                         : Jan 28, 2021
        Minimum number of days between password change          : 0
        Maximum number of days between password change          : 99999
        Number of days of warning before password expires       : 7
        ```