SHELL := /bin/bash

PROJECT_DIR := $(CURDIR)
COMPOSE := docker compose

.PHONY: help up down restart stop ps logs es-logs kibana-logs clean reset status curl-es open-kibana

help:
	@echo "可用命令："
	@echo "  make up           启动 Elasticsearch + Kibana"
	@echo "  make down         删除容器，保留数据卷"
	@echo "  make stop         停止容器"
	@echo "  make restart      重启容器"
	@echo "  make ps           查看容器状态"
	@echo "  make logs         查看全部日志"
	@echo "  make es-logs      查看 Elasticsearch 日志"
	@echo "  make kibana-logs  查看 Kibana 日志"
	@echo "  make status       检查 ES / Kibana 是否可访问"
	@echo "  make curl-es      curl Elasticsearch"
	@echo "  make open-kibana  打印 Kibana 地址"
	@echo "  make clean        删除容器和匿名网络，保留数据卷"
	@echo "  make reset        删除容器和数据卷，彻底重置"

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f

es-logs:
	$(COMPOSE) logs -f elasticsearch

kibana-logs:
	$(COMPOSE) logs -f kibana

clean:
	$(COMPOSE) down --remove-orphans

reset:
	$(COMPOSE) down -v --remove-orphans

curl-es:
	curl http://localhost:9200

open-kibana:
	@echo "Kibana: http://localhost:5601"

status:
	@echo "检查 Elasticsearch..."
	@curl -s http://localhost:9200 >/dev/null && echo "Elasticsearch OK: http://localhost:9200" || echo "Elasticsearch 未就绪"
	@echo "检查 Kibana..."
	@curl -s http://localhost:5601 >/dev/null && echo "Kibana OK: http://localhost:5601" || echo "Kibana 未就绪"