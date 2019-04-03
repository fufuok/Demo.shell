#!/bin/bash
# author: Fufu, 2019-03-29
# fping 指定 IP, 失败时返回日志内容
# usage: chk_fping IP 其他内容
# set -x
#
function chk_fping() {
    local ip=${1:-""}

    # 参数检查
    [[ -z "${ip}" ]] && return 1

    # 存活检查
    fping -qr3 "${ip}" || echo "$* fping_unreachable"
}
