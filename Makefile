.PHONY: build
build: ## build docker image
	docker build -t micimica/imagemagick .

.PHONY: run
run: ## login docker container
	make stop
	docker run --rm -it --name micimica-imagemagick -v `pwd`:/usr/local/ micimica/imagemagick

.PHONY: stop
stop: ## stop docker container
	docker ps -q -f name=micimica-imagemagick | xargs -I% docker stop %

.PHONY: teardown
teardown: ## remove image, and free disk
	docker image ls -q -f reference=micimica/imagemagick | xargs -I% docker image rm -f %
	docker system prune -f

.PHONY: help
help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
