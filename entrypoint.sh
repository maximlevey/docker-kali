#!/bin/bash

# Set password for VNC
mkdir -p /root/.vnc/
echo "${PASSWORD}" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# Start VNC Server
vncserver :0 -rfbport 5900 -geometry 1920x1080 -depth 16 \
    > /var/log/vncserver.log 2>&1

/bin/bash