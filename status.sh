#!/bin/bash
echo "=========================================="
echo "         邮件查看系统状态检查            "
echo "=========================================="
if [ "true" = true ]; then
    echo "服务状态："
    systemctl status mail-system --no-pager -l
    echo ""
else
    echo "进程状态："
    if pgrep -f "python3 app.py" > /dev/null; then
        echo "✅ 邮件查看系统正在运行"
        ps aux | grep "python3 app.py" | grep -v grep
    else
        echo "❌ 邮件查看系统未运行"
    fi
    echo ""
fi

echo "端口占用情况："
netstat -tlnp 2>/dev/null | grep :8005 || echo "端口8005未被占用"
echo ""

echo "最近日志："
if [ -f "/var/log/mail-system/app.log" ]; then
    tail -10 /var/log/mail-system/app.log
else
    echo "暂无日志文件"
fi
