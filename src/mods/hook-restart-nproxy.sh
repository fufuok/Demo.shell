#!/bin/bash
# author: Fufu, 2019-08-22
# 重启 nproxy 的逻辑定义
# shellcheck disable=SC1090
# set -x
#
function hook_send_alarm_before() {
    # 各种逻辑
    # nproxy
    # domain
    true || return 0

    # 业务
    # restart_service

    # 日志
    echo "$(date +%F_%T) restart nproxy success" >>/var/log/restart-nproxy.log
}
