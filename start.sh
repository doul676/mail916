#!/bin/bash
cd "/root/mail"
source venv/bin/activate
export DATABASE_TYPE=${DATABASE_TYPE:-sqlite}
export PORT=${PORT:-8005}

if [ "true" = true ]; then
    systemctl start mail-system
    echo "邮件查看系统已通过systemd启动"
else
    nohup python3 app.py > /var/log/mail-system/app.log 2>&1 &
    echo "邮件查看系统已后台启动，日志: /var/log/mail-system/app.log"
fi
