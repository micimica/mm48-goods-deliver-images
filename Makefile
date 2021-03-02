.PHONY: help
help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## build docker image
	docker build -t micimica/imagemagick .

.PHONY: attach
attach: ## attach docker container
	make stop
	docker run --rm -it --name micimica-imagemagick -v `pwd`:/usr/local/ micimica/imagemagick

.PHONY: exec
exec: ## execute all scripts using docker
	docker run --rm -it --name micimica-imagemagick -v `pwd`:/usr/local/ micimica/imagemagick /bin/sh -c "ls *.sh | xargs -I% ./%"

.PHONY: stop
stop: ## stop docker container
	docker ps -q -f name=micimica-imagemagick | xargs -I% docker stop %

.PHONY: dispose
dispose: ## dispose docker images for free disk
	docker image ls -q -f reference=micimica/imagemagick | xargs -I% docker image rm -f %
	docker system prune -f
