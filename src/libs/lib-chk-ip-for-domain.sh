#!/bin/bash
# author: Fufu, 2019-03-03
# 根据指定 IP 检查 URL 状态码, 类似写 HOSTS 效果
# usage: chk_ip_for_domain 正确的状态码 域名 URI 端口 检测次数 指定 IP
# usage: chk_ip_for_domain 200 www.fufuok.com /act.shtml?123 80 3 123.4.5.6
# set -x
#
function chk_ip_for_domain() {
    # 200 www.fufuok.com /act.shtml?123 80 3 123.4.5.6
    (($# < 1)) && return 1
    local http_code=$1
    local domain=${2:-""}
    local uri=${3:-""}
    local -i port=${4:-443}
    local -i count=${5:-1}
    local ip=${6:-""}
    ((count < 1)) && count=1

    # curl 参数
    local result_code
    local curl_cmd="curl -X GET -ksI -m 5 -o /dev/null -w %{http_code}"
    local scheme="http://"
    ((port == 443)) && scheme="https://"

    for i in $(seq 1 $count); do
        # 重试时延迟 1 秒
        ((i > 1)) && sleep 1
        if [[ -n "${ip}" ]]; then
            # 指定 IP 访问
            result_code=$(${curl_cmd} --resolve "${domain}:${port}:${ip}" "${scheme}${domain}${uri}")
        else
            # 直接域名访问
            result_code=$(${curl_cmd} "${scheme}${domain}${uri}")
        fi
        [[ "${http_code}" == "${result_code}" ]] && break
    done

    # 返回错误日志
    [[ "${http_code}" != "${result_code}" ]] &&
        echo "${domain} ${http_code} ${result_code} ${ip} curl_failed"
}
