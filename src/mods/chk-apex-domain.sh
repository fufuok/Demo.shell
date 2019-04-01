#!/bin/bash
# author: Fufu, 2019-03-03
# 监控 Origin 平台 Apex 英雄的域名访问是否正常
# usage: ./start.sh chk-apex-domain
# usage: ./start.sh chk-apex-domain ./src/chk-apex-domain.conf 2 3
# set -x
#
export API="http://xxx/?info="

# Apex 检测条件
# dpkg -l | grep -q xxx || return 0

# 引入通用检测方法
source "${LIBS}/lib-chk-common-main.sh"

# 执行检测并报警
chk_common_main chk_ip_for_domain "$@"
