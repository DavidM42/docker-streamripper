#!/bin/bash

PUID=${PUID:-568}
PGID=${PGID:-568}

groupmod -o -g "$PGID" streamripper
usermod -o -u "$PUID" streamripper
chown -R streamripper:streamripper /home/streamripper

if [ $# -gt 0 ]; then
  exec gosu streamripper "$@"
else
  # otherwise, default to no args (=> help output)
  exec gosu streamripper
fi
