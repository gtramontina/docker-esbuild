SHELL := bash -eu -o pipefail -c
.DELETE_ON_ERROR:

# ---

container-registry := ghcr.io
image-owner := gtramontina
image-name := esbuild
image := $(container-registry)/$(image-owner)/$(image-name)
tag = $(shell node -p "require('./package.json').dependencies.esbuild")

# ---

build.log: package.json Dockerfile Makefile
	@docker build -t $(image):$(tag) . | tee $@
to-clobber += $(image):$(tag)
to-clean += build.log

test.log: build.log
	@[ `docker run --rm $(image):$(tag) --version` = "$(tag)" ] | tee $@
to-clean += test.log

# ---

.PHONY: build
build: build.log

.PHONY: test
test: test.log

.PHONY: push
push: test
	@docker push $(image):$(tag)

.PHONY: clean
clean:; @rm -rf $(to-clean)

.PHONY: clobber
clobber: clean
	@docker rmi $(to-clobber) --force
