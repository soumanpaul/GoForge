# GoForge — AI Backend Platform in Go

GoForge is a backend engineering project for building an AI document-processing service with Go. Practice HTTP APIs, background jobs, databases, concurrency, and operating reliable services.

## Current status

The starter uses Go’s standard library and includes:

- An HTTP API with `GET /healthz`.
- Configurable listen address through `HTTP_ADDR` (default `:8080`).
- Structured logs, HTTP timeouts, and graceful shutdown.
- Commands for running, building, formatting, and checking the project.

Document processing, persistence, workers, authentication, and AI provider integration are planned; they are not implemented yet.

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

Start with one repository containing an API and a worker, backed by PostgreSQL:

```text
Client -> Go HTTP API -> PostgreSQL (documents, jobs, results)
                              ^
                              |
                          Go worker -> AI provider
```

1. Add document submission and job-status endpoints backed by PostgreSQL.
2. Add a worker that claims persisted jobs and calls an AI provider to summarize documents.
3. Handle timeouts, bounded concurrency, retries, and duplicate job execution.
4. Add authentication, request limits, integration tests, and deployment configuration.
5. Add progress streaming, metrics, and load testing.

Add Redis when caching or distributed rate limiting is needed. Add Kafka when there is a concrete need for event distribution or replay.

## Repository layout

```text
cmd/api/main.go    HTTP API entry point
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
