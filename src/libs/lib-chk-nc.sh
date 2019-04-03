#!/bin/bash
# author: Fufu, 2019-03-29
# nc 指定 IP 和 端口, 失败时返回日志内容
# usage: chk_nc IP 端口 其他内容
# usage: chk_nc 74.201.103.204 443 blhp.www.vivox.com
# set -x
#
function chk_nc() {
    local ip=${1:-""}
    local -i port=${2:-443}

    # 参数检查
    [[ -z "${ip}" ]] || [[ -z "${port}" ]] && return 1

    # 存活检查
    nc -w1 "${ip}" "${port}" || nc -w1 "${ip}" "${port}" || echo "$* nc_unreachable"
}
