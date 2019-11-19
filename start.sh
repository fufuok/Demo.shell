#!/bin/bash
# author: Fufu, 2019-03-03
# 入口文件, Shell 模块调用, 传递模块参数
# usage: ./start.sh module-shell-name module-shell-args
# usage: ./start.sh chk-apex-domain
# usage: ./start.sh chk-apex-domain ./etc/chk-apex-domain.conf 2 3
# shellcheck disable=SC1090,SC2034
# set -x
# set -o nounset
# set -o errexit
#
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
readonly BASE=$(cd "$(dirname "$0")" && pwd)
readonly NAME=$(basename "$0" .sh)
readonly ETC="${BASE}/etc"
readonly SRC="${BASE}/src"
readonly MODS="${SRC}/mods"
readonly LIBS="${SRC}/libs"

# 使用说明
function usage() {
    echo "Usage: ./${NAME}.sh [module-shell-name] [module-shell-args]"
}

# 第一个参数为待调用的 Shell 模块名 e.g. chk-pubg-domain
M_NAME=${1:-"${NAME}"}

# ./src/mods/chk-pubg.domain.sh
MOD="${MODS}/${M_NAME}.sh"
if [[ -f "${MOD}" ]]; then
    shift
    source "${MOD}" "$@"
else
    usage
fi

exit 0
