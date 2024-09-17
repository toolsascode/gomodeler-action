GOBASE := $(shell pwd)
GOBIN := $(shell go env GOPATH)/bin

.PHONY: help
all: help

.PHONY: test
test:
	@echo #####
	@echo ##### Installing GoModeler
	go install -v github.com/toolsascode/gomodeler@latest
	@echo ##### Running :: Testing Complete
	$(GOBIN)/gomodeler -f ./.github/workflows/examples/complete/envFile.yaml \
        --template-path ./.github/workflows/examples/complete/templates \
        --output-path ./.github/workflows/examples/complete/outputs \
        --log-level debug

	@echo ##### Running :: Testing Summary
	$(GOBIN)/gomodeler -f ./.github/workflows/examples/summary/envFile.yaml \
        --template-path ./.github/workflows/examples/summary/templates \
        --output-path ./.github/workflows/examples/summary/outputs \
        --log-level debug

	@echo ##### Uninstalling GoModeler
	rm $(GOBIN)/gomodeler

.PHONY: help
help: Makefile
	@echo
	@echo "Usage: make [options]"
	@echo
	@echo "Options:"
	@echo "    build     Create binary file"
	@echo "    run       Run GoModeler"
	@echo "    run-test  Run GoModeler"
	@echo "    dist-test Run GoModeler"
	@echo "    docs  	 Run GoModeler"
	@echo "    version   Set version in go application"
	@echo "    Help	"
