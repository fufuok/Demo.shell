#!/bin/bash
# author: Fufu, 2019-03-29
# 绝地求生全业务监控(示例代码)
# usage: ./start.sh pubg-monitor
# shellcheck disable=SC1090
# set -x
#
export API="http://xxx/?info="

# PUBG 检测条件
# dpkg -l | grep -q xxx || return 0

# 引入通用检测方法
source "${LIBS}/lib-chk-common-main.sh"

# hook 示例
source "${MODS}/hook-restart-nproxy.sh"

# 检测 PUBG 大厅域名等
chk_common_main chk_ip_for_domain "${ETC}/chk-pubg-domain.conf" &

# fping blhp.www.vivox.com
chk_common_main chk_fping "${ETC}/chk-pubg-fping.conf" &

# telnet/nc prod-live-entry
chk_common_main chk_nc "${ETC}/chk-pubg-nc.conf" &

wait
