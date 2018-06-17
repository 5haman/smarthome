default: build start

build:
	docker-compose build

start:
	docker-compose up -d

restart:
	docker-compose restart

log:
	docker-compose logs -f --tail=100

.PHONY: build
