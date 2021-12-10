#!/bin/bash

yum install -y cifs-utils

mkdir -p /mnt/transit
mkdir -p /mnt/readonly

chown 1000:1000 -R /mnt/transit
chown 1000:1000 -R /mnt/readonly

chmod -R 777 /mnt/transit
chmod -R 777 /mnt/readonly

touch /etc/fstab
chmod 777 /etc/fstab

chmod u+s /usr/bin/mount
chmod u+s /usr/bin/umount
chmod u+s /usr/sbin/mount.cifs