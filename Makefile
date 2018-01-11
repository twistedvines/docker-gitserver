.PHONY: build push

VERSION=$(shell cat .version)

build:
	docker build -t "gitserver:$(VERSION)" .
	docker tag "gitserver:$(VERSION)" "twistedvines/gitserver:$(VERSION)"

push:
	docker push "twistedvines/gitserver:$(VERSION)"
