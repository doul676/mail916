#!/bin/bash
if [ "true" = true ]; then
    systemctl restart mail-system
    echo "邮件查看系统已重启"
else
    $0/../stop.sh
    sleep 2
    $0/../start.sh
fi
