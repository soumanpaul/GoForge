# RustForge — Production AI Backend Platform
- Rust + backend + async + databases + distributed systems + AI infrastructure + production engineering.

```
                    RustForge
                        │
        ┌───────────────┼───────────────┐
        ↓               ↓               ↓
      API           Background       Streaming
                     Workers
        │               │               │
        └───────────────┼───────────────┘
                        ↓
                   PostgreSQL
                        +
                      Redis
                        +
                     Kafka
                        +
                  AI Providers
```

# Techs
- Rust
 + Axum
 + Tokio
 + PostgreSQL
 + Redis




 my_project/
├── Cargo.toml               # Project manifest (metadata & dependencies)
├── Cargo.lock               # Exact dependency versions (managed by Cargo)
├── src/                     # Application source code
│   ├── main.rs              # Entry point for the default binary crate
│   ├── lib.rs               # Entry point for the library crate
│   ├── utils.rs             # A single-file module (utils)
│   └── database/            # A multi-file directory module
│       ├── mod.rs           # Module declaration (pre-Rust 2018 style) OR
│       └── connection.rs    # Submodule within database
├── src/bin/                 # Additional standalone binary executables
│   ├── internal_tool.rs     
│   └── admin_cli.rs         
├── tests/                   # Integration tests (black-box testing)
│   └── integration_test.rs  
├── examples/                # Example scripts demonstrating how to use a library
│   └── basic_usage.rs       
└── benches/                 # Benchmark tests 
    └── speed_test.rs        
