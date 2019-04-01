#!/bin/bash
# author: Fufu, 2019-03-03
# 发出报警
# usage: send_alarm "报警内容" "API_URL"
# set -x
#
function send_alarm() {
    local info=${1// /:}
    local api_url=${2:-"http://xxx/?info="}
    curl "${api_url}${info}" >/dev/null 2>&1
}
