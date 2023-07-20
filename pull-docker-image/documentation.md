Nautilus project developers are planning to start testing on a new project. 
As per their meeting with the DevOps team, they want to test containerized 
environment application features. As per details shared with DevOps team, 
we need to accomplish the following task:

a. Pull busybox:musl image on App Server 2 in Stratos DC and re-tag 
(create new tag) this image as busybox:media.

APP SERVER 3
=============
    1. ssh steve@stapp02
    2. sudo su -
    3. docker image pull busybox:musl
       ```
        musl: Pulling from library/busybox
        0ed3ade423eb: Downloading  9.583kB/858.2k0ed3ade423eb: Pull complete 
        Digest: sha256:2cc0a479d265aa9f18e2cc5c64ed3144cd60fa1a65be8635a63acd5203f1fc24
        Status: Downloaded newer image for busybox:musl
        docker.io/library/busybox:musl
        ```
    4. docker image tag busybox:musl busybox:news
    5. docker images
        ```diff
          REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
        + busybox      musl      7b10eaf5a34c   2 weeks ago   1.41MB
        - busybox      news      7b10eaf5a34c   2 weeks ago   1.41MB
        ```