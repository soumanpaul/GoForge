.PHONY: run build test check fmt

run:
	go run ./cmd/api

build:
	go build -o bin/goforge-api ./cmd/api

test:
	go test ./...

check:
	go vet ./...

fmt:
	gofmt -w cmd
