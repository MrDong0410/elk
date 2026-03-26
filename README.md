# elk_demo

一个用 Go 做的 ELK 示例项目，主要拿来演示日志的采集、传输和检索。

## 这项目是干嘛的

- 应用产生日志
- 日志进入 ELK 链路
- 在 Kibana 里查日志、排问题

## 本地准备

- Go 1.20+
- Elasticsearch
- Logstash
- Kibana

把项目里的连接地址、端口和索引配置改成你本地可用的环境。

## 运行

先安装依赖：

```bash
go mod tidy
```

如果程序入口就在项目根目录，可以直接跑：

```bash
go run .
```

如果入口在 `cmd` 目录之类的位置，就按实际入口运行，比如：

```bash
go run ./cmd/...
```

## 测试

```bash
go test ./...
```

## 常见可配项

- Elasticsearch 地址
- Logstash 端口
- Kibana 地址
- 日志级别
- 日志输出格式

## 后面可以继续补

- 项目目录说明
- 部署方式
- 日志字段说明
- Kibana 查询示例
- 告警配置
