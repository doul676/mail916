#!/bin/bash
if [ "true" = true ]; then
    systemctl stop mail-system
    echo "邮件查看系统已停止"
else
    pkill -f "python3 app.py" || echo "未找到运行中的邮件查看系统进程"
fi
