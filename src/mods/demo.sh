#!/bin/bash
# author: Fufu, 2019-03-03
# 示例模块
# usage: ./start.sh demo
# usage: ./start.sh demo arg1 arg...
# set -x
#
function main() {
    echo "环境变量, PATH: ${PATH}"
    echo "工作目录, BASE: ${BASE}"
    echo "资源目录, SRC: ${SRC}"
    echo "模块目录, MODS: ${MODS}"
    echo "类库目录, LIBS: ${LIBS}"
    echo "当前模块, MOD: ${MOD}"
    echo "主脚本名, NAME: ${NAME}"
    echo "模块名称, M_NAME: ${M_NAME}"
    echo "参数个数: $#"
    echo "第一个参数: ${1:-''}"
    echo "所有参数: $@"
}

main "$@"
