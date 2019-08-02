#!/bin/bash
# author: Fufu, 2019-03-28
# 调用相应的函数处理配置文件内容
# usage: exec_conf_async "func_name func_args" conf-file running_n
# usage: exec_conf_async chk_domain_async "${ETC}/chk-pubg-domain.conf" 10
# usage: exec_conf_async 'chk_common_async chk_fping' "${ETC}/chk-pubg-fping.conf" 20
# set -x
#
function exec_conf_async() {
    local func_args=$1
    local func_name=${1%% *}
    local conf_file=${2:-"${ETC}/${M_NAME}.conf"}
    local -i running_n=${3:-20}

    # 检查被调用函数
    if [[ $(type -t "${func_name}") != "function" ]]; then
        echo "Check function: ${func_args}" && usage
        return 1
    fi

    # 检查配置文件
    if [[ ! -f "${conf_file}" ]]; then
        echo "Check conf_file: ${conf_file}" && usage
        return 1
    fi

    # 循环调用函数
    local i=1
    while read -r conf; do
        # 排除空行和注释行
        [[ -z "${conf}" ]] || [[ "${conf:0:1}" == "#" ]] && continue
        # 反射
        eval "${func_args} ${conf} &"
        # 并发 20 个进程
        ((running_n > 0)) && [[ $((i % running_n)) == 0 ]] && wait
        ((i++))
    done <"${conf_file}"
    wait
}
