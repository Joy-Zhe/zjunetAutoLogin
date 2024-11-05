#!/bin/bash

# 无限循环，持续检测网络状态
while true; do
    if ping -c 1 baidu.com &> /dev/null; then
        echo "网络正常，连接 baidu.com 成功"
    else
        echo "无法连接 baidu.com，尝试运行登录脚本..."
        python /app/zjunetAutoLogin.py
    fi

    # 休眠 5 分钟后再进行下一次检测
    sleep 300
done
