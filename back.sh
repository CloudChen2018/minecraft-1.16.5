#!/bin/bash
#
# install
#   sudo crontab -e
#
# Add line:
#   0 3 * * * /srv/dev-disk-by-label-RaidDISK/cloudchen-raid/Minecraft-1.16/back.sh


cd /srv/dev-disk-by-label-RaidDISK/cloudchen-raid/Minecraft-1.16

echo "Stop minecraft..."

docker-compose stop

echo "minecraft has been stopped"

chown -R cloud volumes/
chgrp -R users volumes/

echo "file permissions has been changed"

git add .

echo "file has been added"

git commit -m "Auto Backup"

echo "git commited"

chown -R cloud .git/
chgrp -R users .git/

echo "Start minecraft..."

docker-compose up -d

echo "minecraft has been started"
