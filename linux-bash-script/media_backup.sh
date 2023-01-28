#!/bin/bash

zip -r /backup/xfusioncorp_media.zip /var/www/html/media

scp /backup/xfusioncorp_media.zip clint@stbkp01:/backup/



