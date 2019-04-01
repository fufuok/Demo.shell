# Shell 示例代码(微框架)

## 功能

1. 监控域名从指定 IP 访问是否正常(绝地求生 / Apex 英雄)
2. 可配置状态码, URI, 端口, 以及指定域名 IP 访问
3. 支持任意 URL 状态码监控, 多配置文件支持
4. 支持自定义域名检测重试次数
5. 异常日志, 心跳日志
6. 异步多进程
7. 其他..

## 依赖

1. curl
2. fping
3. nc
4. 报警 api

## 使用

```
# 入口脚本 模块名 模块参数
./start.sh
./start.sh demo arg1 arg...
./start.sh pubg-monitor
./start.sh chk-apex-domain
./start.sh chk-apex-domain ./src/chk-apex-domain.conf
./start.sh chk-apex-domain ./src/chk-apex-domain.conf 2 3
```

## 目录

- start.sh: 入口脚本文件, 任意名称
- src: 资源目录
    - libs: 公共类库目录, 由 mods 脚本调用
    - mods: 模块目录, 脚本主要逻辑处理, 根据 start.sh 执行时第一个参数调用
    - ...: 其他文件, 通常为 conf 等配置文件

## 说明

1. 单一入口, 模块化结构, 复用性高, 扩展性好, 打包方便
2. 结构清晰, 可读性强, 适合大多数中小 Shell 项目
3. shellcheck 检测通过, 符合 Shell 代码规范
