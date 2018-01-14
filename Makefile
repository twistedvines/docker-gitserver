.PHONY: build push tag

VERSION=$(shell cat .version)

build:
	docker build -t "gitserver:latest" .

tag:
	docker tag "gitserver:latest" "gitserver:$(VERSION)"
	docker tag "gitserver:latest" "twistedvines/gitserver:$(VERSION)"

push:
	docker push "twistedvines/gitserver:$(VERSION)"
