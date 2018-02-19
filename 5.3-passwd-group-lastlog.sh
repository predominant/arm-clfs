#!/bin/bash

. _common.sh

build_line "i Setup mtab .."
ln -sf /proc/mounts "${CLFS}/targetfs/etc/mtab"

build_line "i Setup passwd file .."
cat > "${CLFS}/targetfs/etc/passwd" << EOF
root::0:0:root:/root:/bin/ash
EOF

build_line "i Setup group file .."
cat > "${CLFS}/targetfs/etc/group" << "EOF"
root:x:0:
bin:x:1:
sys:x:2:
kmem:x:3:
tty:x:4:
tape:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
EOF

build_line "i Setup lastlog file .."
touch "${CLFS}/targetfs/var/log/lastlog"
chmod -v 664 "${CLFS}/targetfs/var/log/lastlog"
