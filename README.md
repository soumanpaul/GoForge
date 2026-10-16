# GoForge — AI Backend Platform in Go

GoForge is an AI backend platform built with Go, covering HTTP APIs, background workers, streaming, PostgreSQL, Redis, Kafka, and AI provider integrations. Practice backend development, concurrency, databases, distributed systems, AI infrastructure, and production engineering.

See [the platform architecture](docs/architecture.md) for the product scope, component diagram, Go structure, and delivery stages.

## Current status

The starter uses Go’s standard library and includes:

- An HTTP API with `GET /healthz`.
- Configurable listen address through `HTTP_ADDR` (default `:8080`).
- Structured logs, HTTP timeouts, and graceful shutdown.
- Commands for running, building, formatting, and checking the project.

Persistence, workers, streaming, Redis, Kafka, authentication, and AI provider integration are planned; they are not implemented yet.

## Run locally

Requires Go 1.24 or newer. Make is optional.

```sh
go run ./cmd/api
```

Check the running service from another terminal:

```sh
curl http://localhost:8080/healthz
# {"status":"ok"}
```

Set a different address if needed:

```sh
HTTP_ADDR=127.0.0.1:9090 go run ./cmd/api
```

Configuration comes from process environment variables. The application does not load `.env` files automatically.

## Development commands

| Task | Make command | Go command |
| --- | --- | --- |
| Run API | `make run` | `go run ./cmd/api` |
| Build binary | `make build` | `go build -o bin/goforge-api ./cmd/api` |
| Run tests | `make test` | `go test ./...` |
| Static checks | `make check` | `go vet ./...` |
| Format source | `make fmt` | `gofmt -w cmd` |

The starter has no automated tests yet. The test command is provided for future development.

## Build plan

Build the platform incrementally: API and PostgreSQL, background AI jobs, streaming, Redis, and Kafka. Add authentication, reliability checks, observability, and deployment support throughout development.

The [architecture document](docs/architecture.md) describes the full plan. Document processing is one possible example workload within this platform.

## Repository layout

```text
cmd/api/main.go    HTTP API entry point
docs/architecture.md Target platform architecture and implementation plan
go.mod             Go module configuration
Makefile           Development commands
```

The module path is currently `goforge` for local development. Update it to the repository’s canonical import path before publishing reusable packages.




## Go development tools
uv and nodemon serve different purposes. In Go, the equivalents are:

| Purpose | Go tool |
|---|---|
| Manage dependencies, similar to uv | Built-in `go get` and `go mod tidy` |
| Run the application | `go run ./cmd/api` |
| Build an executable | `go build` |
| Run tests | `go test ./...` |
| Restart automatically when files change, like nodemon | **Air**, a separate development tool |

Go already includes dependency management, building, and testing in its [standard CLI (https://pkg.go.dev/cmd/go)](<https://pkg.go.dev/cmd/go>). For automatic rebuilds and restarts, [Air (https://github.com/air-verse/air)](<https://github.com/air-verse/air>) provides that workflow.

For GoForge, I recommend **Go’s native commands plus Air for development**. The Makefile is just a convenience.
