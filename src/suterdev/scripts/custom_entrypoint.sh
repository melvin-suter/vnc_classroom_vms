#!/bin/bash

mkdir -p /mnt/transit
mkdir -p /mnt/readonly
echo "//$SMB_HOST/transit /mnt/transit cifs noauto,user,rw,guest 0 0" >> /etc/fstab
if [[ "$SMB_RO_MODE" == "rw" ]] ; then
    echo "//$SMB_HOST/readonly_admin /mnt/readonly cifs noauto,user,$SMB_RO_MODE,guest 0 0" >> /etc/fstab
else
    echo "//$SMB_HOST/readonly /mnt/readonly cifs noauto,user,$SMB_RO_MODE,guest 0 0" >> /etc/fstab
fi

mount /mnt/transit
mount /mnt/readonly

/dockerstartup/vnc_startup.sh -d