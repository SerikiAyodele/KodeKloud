#!/bin/bash

zip -r xfusioncorp_blog.zip /var/www/html/blog

# Save the archive to the temporary backup location
cp xfusioncorp_blog.zip /backup/

# Save the archive to the Nautilus Backup Server
scp xfusioncorp_blog.zip clint@stbkp01:/backup

# Copy the archive to the Nautilus Backup Server
scp xfusioncorp_blog.zip clint@stbkp01:/backup