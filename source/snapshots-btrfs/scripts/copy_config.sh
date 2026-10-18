#!/bin/bash
#
# Copy config files to ram tmpfs.
#
/usr/bin/rm /tmp/snapshots-btrfs/config/*.cfg
/usr/bin/cp /boot/config/plugins/snapshots-btrfs/*.cfg /tmp/snapshots-btrfs/config/ 2>/dev/null
