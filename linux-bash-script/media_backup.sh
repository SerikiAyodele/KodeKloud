#!/bin/bash

zip -r xfusioncorp_media.zip /var/www/html/media

# Save the archive to the temporary backup location
cp xfusioncorp_media.zip /backup/

# Save the archive to the Nautilus Backup Server
scp xfusioncorp_media.zip clint@stbkp01:/backup

# Copy the archive to the Nautilus Backup Server
scp xfusioncorp_media.zip clint@stbkp01:/backup



